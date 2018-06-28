#include <stdio.h>
#include <unistd.h>

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
	// 光らせる時刻(タイムスタンプ)(0-16,777,215)
	int timestamp[FLASH_NUM] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
	for (int i = 0; i < FLASH_NUM; i++) {
		pattern[i] = 0;
		// パターンは下8bitに代入
		pattern[i] += p[FLASH_NUM];
		// タイムスタンプは上24bitに代入
		pattern[i] += timestamp[i] * 256;
	}
}

// ゲーム本番
void run() {
	printf("Game Start!\n");
	int i = 0;
	while (1) {
		// 送信
		printf("Send %d\n", i++);
		usleep(SLEEP_TIME);
	}
}