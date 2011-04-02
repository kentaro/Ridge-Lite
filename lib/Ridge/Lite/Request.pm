package Ridge::Lite::Request;
use strict;
use warnings;

use base qw(Ridge::Request);

$Ridge::Request::PREFERRED_URI = 'Ridge::Lite::URI';

sub route {
    my ($self, $namespace, $router) = @_;
    $self->uri->route($namespace, $router, $self->env);
}

!!1;
