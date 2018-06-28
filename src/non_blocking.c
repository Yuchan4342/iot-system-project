#include <stdio.h>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[]){
  int i;
  char buff[256];
  char rt = '\n';
  char keys[9] = "asdfjkl;";
  struct termios term_attr;
  tcgetattr(0, &term_attr);
  term_attr.c_lflag &= ~(ICANON|ECHO);
  term_attr.c_cc[VMIN] = 8;
  term_attr.c_cc[VTIME] = 0;
  tcsetattr(0, TCSANOW, &term_attr);
  fcntl(0, F_SETFL, O_NONBLOCK);
  char bits[256];
  char c[8];
  while(1){
    memset(bits, '0', sizeof(bits));
    read(0, &c, 8);
    for(i=0;i<8;i++){
      bits[c[i]-'a'] = '1';
    }
    for(i=0;i<8;i++){
      write(0, &bits[keys[i]-'a'], 1);
    }
    write(0, &rt, 1);
    usleep(1000*300);
  }
}
