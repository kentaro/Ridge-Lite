use strict;
use warnings;

use Path::Class;
my $root = dir(__FILE__)->parent;

use Plack::Builder;

use lib 'eg/simple/lib';
use MyApp;

builder {
    enable 'Plack::Middleware::Static',
        root => $root->subdir('.'),
        path => qr{^/(images|css|js|favicon)};

    sub {
        my $env = shift;
        MyApp->process($env, { root => $root });
    }
};
