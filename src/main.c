#include <stdio.h>
#include <curses.h>

void run();

int main(int argc, char* argv[]) {
	initscr();
	noecho();
	cbreak();
	run();
	endwin();
	return 0;
}

void run() {
	char input = '\0';
	while (1) {
		input = getch();
		if (input == 'q') break;
	}
}