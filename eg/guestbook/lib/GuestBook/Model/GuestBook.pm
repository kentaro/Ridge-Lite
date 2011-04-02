package GuestBook::Model::GuestBook;
use strict;
use warnings;
use parent qw(DBIx::MoCo);

use DateTime;
use DBIx::MoCo::MUID;

use GuestBook::Model::DataBase;

__PACKAGE__->db_object('GuestBook::Model::DataBase');
__PACKAGE__->table('guestbook');

__PACKAGE__->utf8_columns(qw(name comment));
__PACKAGE__->inflate_column(created => 'DateTime');

__PACKAGE__->add_trigger(
    before_create => sub {
        my ($class, $args) = @_;
        $args->{muid}    ||= create_muid();
        $args->{created} ||= DateTime->now(time_zone => 'Asia/Tokyo');
    }
);

!!1;
