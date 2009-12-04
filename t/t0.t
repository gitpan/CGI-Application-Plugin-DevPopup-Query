#!/usr/env perl

# $Id: t0.t 14 2009-12-04 12:47:11Z stro $

use strict;
use warnings;

BEGIN {
	use Test;
	plan('tests' => 1);
}

require CGI::Application::Plugin::DevPopup::Query; # require, no use -- import wouldn't work this way

ok(1); # sanity check and other modules skipping workaround

