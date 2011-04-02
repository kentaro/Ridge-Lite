package GuestBook::Model::DataBase;
use strict;
use warnings;
use parent qw(DBIx::MoCo::DataBase);

use GuestBook::Config;
my $config = GuestBook::Config->load->app_config;

__PACKAGE__->dsn($config->param('dsn'));
__PACKAGE__->username($config->param('username'));
__PACKAGE__->password($config->param('password'));

!!1;
