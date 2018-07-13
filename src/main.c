#include <stdio.h>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "../DE10_NANO_SoC_GHRD/hps_0.h"

#define FLASH_NUM 10
#define SLEEP_TIME 1000

#define HW_REGS_BASE (ALT_STM_OFST)
#define HW_REGS_SPAN (0x04000000)
#define HW_REGS_MASK (HW_REGS_SPAN - 1)

void sendPattern();
void run();

void *virtual_base;
void *h2p_lw_addr;

int main(int argc, char* argv[]) {
  int fd;
  // メモリ空間をボードに割り当てる
  // map the address space for the LED registers into user space so we can interact with them.
  // we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

  if ((fd = open( "/dev/mem", (O_RDWR|O_SYNC))) == -1) {
    printf("ERROR: could not open \"/dev/mem\"...\n");
    return 1;
  }
  virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ|PROT_WRITE),
                      MAP_SHARED, fd, HW_REGS_BASE);
  if (virtual_base == MAP_FAILED) {
    printf("ERROR: mmap() failed...\n");
    close(fd);
    return 1;
  }
  h2p_lw_addr = virtual_base
      + ((unsigned long)(ALT_LWFPGASLVS_OFST + MYPIO_0_BASE)
          & (unsigned long)(HW_REGS_MASK));
  sendPattern();
  usleep(1000000);
  run();
  // clean up our memory mapping and exit
  if (munmap(virtual_base, HW_REGS_SPAN ) != 0) {
    printf("ERROR: munmap() failed...\n");
    close(fd);
    return 1;
  }
  close(fd);
  return 0;
}

// 光るタイミングとパターンをボードに送信する
void sendPattern() {
  printf("Sending pattern when LEDs flash.\n");
  int i;
  // ボードに送信するコードはここに
  unsigned int pattern[FLASH_NUM];
  // 光らせるLEDのパターン(0-256)
  unsigned int p[FLASH_NUM] = { 1, 2, 4, 8, 16, 32, 64, 128, 256, 255 };
  // 光らせる時刻(タイムスタンプ)(0-1024)
  unsigned int timestamp[FLASH_NUM] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
  for (i = 0; i < FLASH_NUM; i++) {
    // パターンは上から11-18bitに代入
    pattern[i] = (timestamp[i] << 22) | (p[i] << 14);
  }
  for (i = 0; i < FLASH_NUM; i++) {
  	*(uint32_t *)h2p_lw_addr = pattern[i];
    printf("%u\n", pattern[i]);
  	usleep(SLEEP_TIME * 100);
  }
}

// ゲーム本番
void run() {
  printf("Game Start!\n");
  int i = 0;
  char keys[9] = "asdfjkl;";
  struct termios term_attr;
  tcgetattr(0, &term_attr);
  term_attr.c_lflag &= ~(ICANON | ECHO);
  term_attr.c_cc[VMIN] = 8;
  term_attr.c_cc[VTIME] = 0;
  tcsetattr(0, TCSANOW, &term_attr);
  fcntl(0, F_SETFL, O_NONBLOCK);
  char bits[256];
  char c[8];
  int led_pattern;

  while (i < 10000) {
    read(0, &c, 8);
    int j;
    for (j = 0; j < 256; j++)
      bits[j] = '0';
    for (j = 0; j < 8; j++) {
      if (c[j] != 0) bits[c[j] - ';'] = '1';
      c[j] = 0;
    }
    int d = 0x80;
    led_pattern = 0;
    for (j = 0; j < 8; j++) {
      led_pattern += ((bits[keys[j] - ';'] - '0') % 2) * d;
      d /= 2;
    }
    printf("Send: %d\n", led_pattern);
    // ボードのメモリに送信するコードはここに
    *(uint32_t *)h2p_lw_addr = led_pattern;

    i++;
    usleep(SLEEP_TIME * 100);
  }
}
