use strict;
use warnings;

use File::Spec::Functions;
use File::Path qw/ rmtree /;

use Test::More;

ok(rmtree catdir(qw| t var |), 'removed test tempfiles');

done_testing;
