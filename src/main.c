#include <stdio.h>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <string.h>

#define FLASH_NUM 10
#define SLEEP_TIME 1000

void sendPattern();
void run();

int main(int argc, char* argv[]) {
  sendPattern();
  usleep(1000000);
  run();
  return 0;
}

// 光るタイミングとパターンをボードに送信する
void sendPattern() {
  printf("Sending pattern when LEDs flash.\n");
  int i, pattern[FLASH_NUM];
  // 光らせるLEDのパターン(0-255)
  int p[FLASH_NUM] = { 1, 2, 4, 8, 16, 32, 64, 128, 1, 2 };
  // 光らせる時刻(タイムスタンプ)(0-1023)
  int timestamp[FLASH_NUM] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
  for (i = 0; i < FLASH_NUM; i++) {
    pattern[i] = 0;
    // パターンは上から11-18bitに代入
    pattern[i] += (p[i] % 256) * 0x00004000;
    // タイムスタンプは上10bitに代入
    pattern[i] += (timestamp[i] % 1024) * 0x004000000;
  }
  // ボードに送信するコードはここに

}

// ゲーム本番
void run() {
  printf("Game Start!\n");
  int i = 0;
  char rt = '\n';
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
      bits[c[j] - ';'] = '1';
      c[j] = '0';
    }
    int d = 0x80;
    led_pattern = 0;
    for (j = 0; j < 8; j++) {
      led_pattern += ((bits[keys[j] - ';'] - '0') % 2) * d;
      d /= 2;
      write(0, &bits[keys[j] - ';'], 1);
    }
    write(0, &rt, 1);
    printf("%d\n", led_pattern);
    // ボードに送信するコードはここに

    i++;
    usleep(SLEEP_TIME * 100);
  }
}
