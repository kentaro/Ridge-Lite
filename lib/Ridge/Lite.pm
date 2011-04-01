package Ridge::Lite;
use strict;
use warnings;

use UNIVERSAL::require;
use Router::Simple::Sinatraish;

use Ridge::Lite::Request;
use Ridge::Lite::Config;

sub import {
    my %args    = @_ || ();
    my ($class) = caller();

    my $base    = $args{-base} ? $args{-base} : 'Ridge';
       $base->use or die $@;
    unshift @Ridge::Lite::ISA, $base;

    {
        no strict 'refs';
        unshift @{"$class\::ISA"}, 'Ridge::Lite';
    }

    Router::Simple::Sinatraish->export_to_level(1);
    $class->config(Ridge::Lite::Config->new({namespace => 'Ridge::Lite'}));
}

sub make_request {
    my ($class, $env) = @_;
    my $req = Ridge::Lite::Request->new($env);
       $req->route($class->router);
       $req->charset($class->config->param('charset'));
       $req;
}

!!1;
