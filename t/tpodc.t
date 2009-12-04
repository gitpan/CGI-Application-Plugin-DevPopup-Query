#!/usr/bin/env perl -w

# $Id: tpodc.t 14 2009-12-04 12:47:11Z stro $

use strict;
use warnings;

eval 'use Test::More';
if ($@) {
    eval 'use Test; plan tests => 1;';
    skip('Test::More is required for testing POD coverage',);
} else {
    require Test::More;
    eval 'use Test::Pod::Coverage 1.00';
    plan ('skip_all' => 'Test::Pod::Coverage is required for testing POD coverage') if $@;
    all_pod_coverage_ok();
}