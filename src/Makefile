TARGET = main

CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -Dsoc_cv_av -g -Wall -I ${SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include
LDFLAGS =  -g -Wall
CC = $(CROSS_COMPILE)gcc
ARCH= arm

build: $(TARGET)

$(TARGET): main.o
	$(CC) $(LDFLAGS) $^ -o $@ -lcurses

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@ -I/usr/include -lcurses

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~

