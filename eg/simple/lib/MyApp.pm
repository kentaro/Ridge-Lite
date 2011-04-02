package MyApp;
use strict;
use warnings;

use Ridge::Lite;

get '/' => sub {
    my $r = shift;
       $r->res->content('Hello World!');
};

!!1;
