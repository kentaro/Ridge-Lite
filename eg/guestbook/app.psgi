use strict;
use warnings;

use Path::Class;
my $root = dir(__FILE__)->parent;

use Plack::Builder;

use lib 'eg/guestbook/lib';
use guestbook;

builder {
    enable 'Plack::Middleware::Static',
        root => $root->subdir('.'),
        path => qr{^/(images|css|js|favicon)};

    sub {
        my $env = shift;
        GuestBook->process($env, { root => $root });
    }
};
