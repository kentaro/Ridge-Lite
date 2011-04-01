package MyApp;
use strict;
use warnings;

use Ridge::Lite;

get '/' => sub {
    my $r = shift;
       $r->res->content_type('text/plain');
       $r->res->content('path: ' . ($r->req->uri->path || ''));
};

get '/foo' => sub {
    my $r = shift;
       $r->res->content_type('text/plain');
       $r->res->content('path: ' . ($r->req->uri->path || ''));
};

get '/bar/baz' => sub {
    my $r = shift;
};

!!1;
