#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "../include/core.h"

struct stat st = {0};

char** init()
{
	if (stat("./.chips", &st) == -1)
		printf("Initializing empty repository in .chips folder.\n");
		mkdir("./.chips/", 0700);
		printf("Repository initialized! Let's get to work.\n");
		// TODO!: Replace string returns with constants.
		return "INITIALIZED";
	
	printf("Repository already initialized!\n");

	// TODO: Handle "NOT_INITIALIZED" (errors in initialization)...	
	return "ALREADY_INITIALIZED";
}

char* status()
{
	return "STATUS...";
}

