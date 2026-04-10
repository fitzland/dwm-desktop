/* See LICENSE file for copyright and license details. */
#include <stdio.h>

#include "../slstatus.h"
#include "../util.h"

const char *
dropbox_status(const char *unused)
{
	FILE *fp;
	char pid[16];

	if (!(fp = popen("pgrep -x dropbox", "r"))) {
		warn("popen 'pgrep -x dropbox':");
		return NULL;
	}

	pid[0] = '\0';
	fgets(pid, sizeof(pid), fp);
	pclose(fp);

	return pid[0] ? "^c#00ff00^ 󰇣" : "^c#ff0000^ 󰇣";
}
