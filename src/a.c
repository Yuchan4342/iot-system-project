#include <stdio.h>
#define FLASH_NUM 10

// 光るタイミングとパターンをボードに送信する
void main() {
  printf("Sending pattern when LEDs flash.\n");
  int i;
  unsigned int pattern[FLASH_NUM];
  // 光らせるLEDのパターン(0-255)
  unsigned int p[FLASH_NUM] = { 1, 2, 4, 8, 16, 32, 64, 128, 1, 2 };
  // 光らせる時刻(タイムスタンプ)(0-1023)
  unsigned int timestamp[FLASH_NUM] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
  for (i = 0; i < FLASH_NUM; i++) {
    // パターンは上から11-18bitに代入
    pattern[i] = (timestamp[i] << 22) + (p[i] << 8);
    printf("%u\n", pattern[i]);
  }
}
