package Ridge::Lite::Request;
use strict;
use warnings;

use base qw(Ridge::Request);

$Ridge::Request::PREFERRED_URI = 'Ridge::Lite::URI';

sub route {
    my ($self, $router) = @_;
    $self->uri->route($router, $self->env);
}

!!1;
