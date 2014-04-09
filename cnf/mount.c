/* mount.c - mount a file system
 *
 * Copyright 2013 Dmitry Golovin <dima@golovin.in>
 *
 * See http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/mount.html

USE_MOUNT(NEWTOY(mount, "t", TOYFLAG_BIN))

config MOUNT
  bool "mount"
  default y
  help
    usage: mount [-t fstype] device dir
    mount a file system
*/

#define FOR_mount
#include "toys.h"

void mount_main(void)
{
  if (toys.optc < 1) {
    // TODO: fstab parsing?
    error_exit("Do not know what to to.");
  } else if (toys.optc == 1) {
    error_exit("Do not know what to do with only 1 argument.");
  } else if (toys.optc == 2 && (toys.optflags ^ FLAG_t)) {
    if (mount(toys.optargs[0], toys.optargs[1], "", 0, "")) {
      perror_exit("Mounting failed");
    } else {
      xprintf("Mounted successfully!\n");
    }
  } else if (toys.optc == 3 && (toys.optflags & FLAG_t)) {
    char *dev, *dir, *type;
    if (toys.argv[1][0] == '-' && toys.argv[1][1] == 't') {
      dev = toys.optargs[1];
      dir = toys.optargs[2];
      type = toys.optargs[0];
    } else if (toys.argv[3][0] == '-' && toys.argv[3][1] == 't') {
      dev = toys.optargs[0];
      dir = toys.optargs[1];
      type = toys.optargs[2];
    } else {
      // weird argument order
      dev = toys.optargs[0];
      dir = toys.optargs[2];
      type = toys.optargs[1];
    }
    if (mount(dev, dir, type, 0, "")) {
      perror_exit("Mounting failed");
    } else {
      xprintf("Mounted successfully!\n");
    }
  } else {
    error_exit("Do not know what to do with %d arguments.", toys.optc);
  }
}