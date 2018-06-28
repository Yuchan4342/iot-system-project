#include <stdio.h>

void sendPattern();

int main(int argc, char* argv[]) {
	sendPattern();
	run();
	return 0;
}

// 光るタイミングとパターンをボードに送信する
void sendPattern() {
	printf("Sending pattern when LEDs flash.");

}

// ゲーム本番
void run() {
	printf("Game Start!\n");
}