#!/usr/bin/perl

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

use warnings;
use strict;

package c89;
use parent '_c_base';

sub initialize {
  my ($self, %conf) = @_;

  $self->{sourcefile}      = 'prog.c';
  $self->{execfile}        = 'prog';
  $self->{default_options} = '-fprofile-arcs -ftest-coverage -Wextra -Wall -Wno-unused -pedantic -Wfloat-equal -Wshadow -std=c89 -lm -Wfatal-errors -fsanitize=alignment,undefined';
  $self->{options_paste}   = '-fdiagnostics-show-caret';
  $self->{options_nopaste} = '-fno-diagnostics-show-caret';
  $self->{cmdline}         = 'gcc -ggdb -g3 $sourcefile $options -o $execfile';

  $self->{default_options} .= ' -Werror' if defined $self->{nick} && $self->{nick} =~ m/marchelz/i;

  $self->{prelude} = <<'END';
#define _XOPEN_SOURCE 9001
#define __USE_XOPEN
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <float.h>
#include <math.h>
#include <limits.h>
#include <sys/types.h>
#include <stdint.h>
#include <errno.h>
#include <ctype.h>
#include <assert.h>
#include <locale.h>
#include <setjmp.h>
#include <signal.h>
#include <time.h>
#include <stdarg.h>
#include <stddef.h>
#include <prelude.h>

END
}

1;
