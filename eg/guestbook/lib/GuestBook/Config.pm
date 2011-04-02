package GuestBook::Config;
use strict;
use warnings;
use parent qw(Ridge::Lite::Config);

__PACKAGE__->setup({
    title   => 'Ridge::Lite Sample',

    # Ridge::Plugin::
    plugins => [qw(XFramework)],

    # $ENV{RIDGE_ENV}の値によって読む設定が変わるので、productionと開発
    # 用などを分けられるよ
    app_config => {
        default => {
            dsn      => 'dbi:mysql:dbname=ridge_lite_sample_default',
            username => 'username',
            password => 'password',

            logger   => Log::Dispatch->new(
                outputs => [[
                    'Screen',
                    min_level => 'debug',
                    newline   => 1,
                    stderr    => 1,
                ]]
            ),
        },
        production => {
            dsn      => 'dbi:mysql:dbname=ridge_lite_sample',
            username => 'username',
            password => 'password',
        },
        staging => {
            dsn      => 'dbi:mysql:dbname=ridge_lite_sample_staging',
            username => 'username',
            password => 'password',
        },
        development => {
            dsn      => 'dbi:mysql:dbname=ridge_lite_sample_development',
            username => 'username',
            password => 'password',
        },
    },
});

!!1;
