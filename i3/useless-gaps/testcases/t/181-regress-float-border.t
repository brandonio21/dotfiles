#!perl
# vim:ts=4:sw=4:expandtab
#
# Please read the following documents before working on tests:
# • http://build.i3wm.org/docs/testsuite.html
#   (or docs/testsuite)
#
# • http://build.i3wm.org/docs/lib-i3test.html
#   (alternatively: perldoc ./testcases/lib/i3test.pm)
#
# • http://build.i3wm.org/docs/ipc.html
#   (or docs/ipc)
#
# • http://onyxneon.com/books/modern_perl/modern_perl_a4.pdf
#   (unless you are already familiar with Perl)
#
# Regression test: Changing border style should not have an impact on the size
# (geometry) of the child window. See ticket http://bugs.i3wm.org/561
# Wrong behaviour manifested itself up to (including) commit
# d805d1bbeaf89e11f67c981f94c9f55bbb4b89d9
#
use i3test;
use Data::Dumper;

fresh_workspace;

my $win = open_floating_window(rect => [10, 10, 200, 100]);

my $geometry = $win->rect;
is($geometry->{width}, 200, 'width correct');
is($geometry->{height}, 100, 'height correct');

cmd 'border 1pixel';

$geometry = $win->rect;
is($geometry->{width}, 200, 'width correct');
is($geometry->{height}, 100, 'height correct');

done_testing;
