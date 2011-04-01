package Ridge::Lite::URI;
use strict;
use warnings;

use base qw(Ridge::URI::Lite);

use Ridge::Lite::Action;

sub route {
    my ($self, $router, $env) = @_;

    if ($self->filter) {
        $self->filter->($self);
    }
    else {
        my $route = $router->match($env) || {};
        my ($action, $view) = ($env->{PATH_INFO} =~ m{^/([^\.]+)(?:\.(.+))?$});

        $self->_action = join '_', (split '/', ($action || 'index'));
        $self->_view   = $view || '';
        $self->_segs   = [$self->action];

        my %params = map  { $_ => $route->{$_} || undef }
                     grep { $_ !~ /(?:controller|action|code)/o } keys %$route;
        $self->param(%params) if %params;

        if ($route->{code}) {
            Ridge::Lite::Action->install($self->action, $self->view || '', $route->{code});
        }
    }
}

!!1;
