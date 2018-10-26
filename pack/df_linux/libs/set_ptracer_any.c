#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/prctl.h>

void set_ptracer_any() __attribute__((constructor));

void set_ptracer_any()
{
	if (-1 == prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY, 0, 0, 0))
		perror("prctl");
}
