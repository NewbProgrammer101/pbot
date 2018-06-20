#!/usr/bin/perl

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

use warnings;
use strict;

package cpp;
use parent '_c_base';

sub initialize {
  my ($self, %conf) = @_;

  $self->{name}            = 'C++';
  $self->{sourcefile}      = 'prog.cpp';
  $self->{execfile}        = 'prog';
  $self->{default_options} = '-fprofile-arcs -ftest-coverage -std=c++14 -Wextra -Wall -Wno-unused -pedantic -Wfloat-equal -Wshadow -lm -Wfatal-errors -fsanitize=alignment,undefined';
  $self->{options_paste}   = '-fdiagnostics-show-caret';
  $self->{options_nopaste} = '-fno-diagnostics-show-caret';
  $self->{cmdline}         = 'g++ -ggdb -g3 $sourcefile $options -o $execfile';

  $self->{prelude} = <<'END';

#define _XOPEN_SOURCE 9001
#define __USE_XOPEN

#include <algorithm>
#include <fstream>
#include <list>
#include <regex>
#include <tuple>
#include <array>
#include <functional>
#include <locale>
#include <scoped_allocator>
#include <type_traits>
#include <atomic>
#include <future>
#include <map>
#include <set>
#include <typeindex>
#include <bitset>
#include <initializer_list>
#include <memory>
#include <sstream>
#include <typeinfo>
#include <chrono>
#include <iomanip>
#include <mutex>
#include <stack>
#include <unordered_map>
#include <codecvt>
#include <ios>
#include <new>
#include <stdexcept>
#include <unordered_set>
#include <complex>
#include <iosfwd>
#include <numeric>
#include <streambuf>
#include <utility>
#include <condition_variable>
#include <iostream>
#include <ostream>
#include <string>
#include <valarray>
#include <deque>
#include <istream>
#include <queue>
#include <vector>
#include <exception>
#include <iterator>
#include <system_error>
#include <forward_list>
#include <iostream>
#include <limits>
#include <ratio>
#include <thread>

#include <cassert>
#include <cinttypes>
#include <csignal>
#include <cstdio>
#include <cwchar>
#include <ccomplex>
#include <ciso646>
#include <cstdalign>
#include <cstdlib>
#include <cwctype>
#include <cctype>
#include <climits>
#include <cstdarg>
#include <cstring>
#include <cerrno>
#include <clocale>
#include <cstdbool>
#include <ctgmath>
#include <cfenv>
#include <cmath>
#include <cstddef>
#include <ctime>
#include <cfloat>
#include <csetjmp>
#include <cstdint>

#include <prelude.h>

END
}

1;
