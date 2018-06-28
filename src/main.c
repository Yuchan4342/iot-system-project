#include <stdio.h>
#include <unistd.h>

#define SLEEP_TIME 1000

void sendPattern();

int main(int argc, char* argv[]) {
	sendPattern();
	runGame();
	return 0;
}

// 光るタイミングとパターンをボードに送信する
void sendPattern() {
	printf("Sending pattern when LEDs flash.\n");

}

// ゲーム本番
void runGame() {
	printf("Game Start!\n");
	int i = 0;
	while (1) {
		// 送信
		printf("Send %d\n", i++);
		usleep(SLEEP_TIME);
	}
}