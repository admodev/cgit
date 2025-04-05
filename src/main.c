#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>

int main(int argc, char *argv[])
{
	int opt;

	enum { INIT, COMMIT, STATUS } mode = STATUS;

	while ((opt = getopt(argc, argv, "ics")) != -1) {
		switch (opt) {
			case 'i': mode = INIT; break;
			case 'c': mode = COMMIT; break;
			case 's': mode = STATUS; break;
			default:
				  fprintf(stderr, "Usage: %s [-ics] [file/s...]\n", argv[0]);
				  exit(EXIT_FAILURE);
		}
	}

	switch (mode) {
		case INIT:
			printf("Initializing...\n");
			break;
		case COMMIT:
			printf("Commit code...\n");
			break;
		case STATUS:
			printf("Status: ...\n");
			break;
		default:
			printf("Status:...\n");
			break;
	}

	return 0;
}

