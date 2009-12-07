package CGI::Application::Plugin::DevPopup::Query;

# $Id: Query.pm 15 2009-12-07 10:52:17Z stro $

use strict;
use warnings;

use base qw/Exporter/;

our $VERSION = '1.01';

sub import {
    my $c = scalar caller;
    $c->add_callback( 'devpopup_report', \&_query_report );
    goto &Exporter::import;
}

sub _query_report {
    my $self = shift;
    my $cgi = _cgi_report($self);
    
    return $self->devpopup->add_report(
        'title'   => 'CGI Query',
        'summary' => 'CGI request parameters',
        'report'  => qq!<style type="text/css">tr.even{background-color:#eee}</style><table><thead><th colspan="2">CGI Query</th></thead><tbody> $cgi </tbody></table>!,
    );
}

sub _cgi_report {
    my $self = shift;

    my $r = 0;
    my $q = $self->query;
    my $report = '<tr><th>param</th><th>value</th></tr>' . 
            join ($/, map {
                    $r=1-$r;
                    qq!<tr class="@{[$r?'odd':'even']}"><td valign="top"> $_ </td><td> @{[$q->param($_)]} </td></tr>!
                  } sort $q->param());
    return $report;
}

1;

=head1 NAME

CGI::Application::Plugin::DevPopup::Query - show CGI query in DevPopup window

=head1 SYNOPSIS

    use CGI::Application::Plugin::DevPopup;
    use CGI::Application::Plugin::DevPopup::Query;

    The rest of your application follows
    ...

=head1 DESCRIPTION

This module is a plugin for L<CGI::Application::Plugin::DevPopup>.
Whenever used, it creates a "CGI Query" section in the DevPopup output. This
section contains a list of CGI query parameters passed to your CGI::Application.

See L<CGI::Application/query()> and L<CGI> for more information about query parameters.

=head1 VERSION

1.01

=head1 SEE ALSO

L<CGI::Application::Plugin::DevPopup>, L<CGI::Application>

=head1 INCOMPATIBILITIES

Not known.

=head1 BUGS AND LIMITATIONS

Not known.

=head1 AUTHOR

Serguei Trouchelle, L<stro@cpan.org>

Most of code is based by CGI::Application::Plugin::DevPopup by Rhesa Rozendaal, L<rhesa@cpan.org>

=head1 LICENSE AND COPYRIGHT

This module is distributed under the same terms as Perl itself.

Copyright (c) 2009 Serguei Trouchelle

=cut
