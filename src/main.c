#include <stdio.h>
#include <unistd.h>

#define SLEEP_TIME 1000

void sendPattern();

int main(int argc, char* argv[]) {
	sendPattern();
	run();
	return 0;
}

// 光るタイミングとパターンをボードに送信する
void sendPattern() {
	printf("Sending pattern when LEDs flash.\n");

}

// ゲーム本番
void run() {
	printf("Game Start!\n");
	int i = 0;
	while (1) {
		// 送信
		printf("Send i\n", i++);
		usleep(SLEEP_TIME);
	}
}