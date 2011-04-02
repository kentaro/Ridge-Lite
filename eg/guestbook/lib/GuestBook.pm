package GuestBook;
use strict;
use warnings;

use Ridge::Lite;

# $rはRidgeオブジェクト。$r->reqとか$r->resとかでごにょる。

# /         => templates/index.html
# /index    => templates/index.html
# /foo      => templates/foo.html
# /foo/bar  => templates/foo_bar.html
# /baz.json => なし。$r->stash->paramの中身をjsonで返す

get '/' => sub {
    my $r = shift;
};

post '/post' => sub {
    my $r = shift;
    my $comment = $r->post_comment(
        name    => $r->req->param('name')    || '',
        comment => $r->req->param('comment') || '',
    );

    if (!$comment) {
        $r->flash->set(error => 'failed to post');
    }

    return $r->res->redirect('/');
};

get '/index.json' => sub {
    my $r = shift;
       $r->stash->param(comments => $r->comments->to_a);
};

use GuestBook::Model::GuestBook;
sub comments {
    my ($self, $limit) = @_;
    my $comments = GuestBook::Model::GuestBook->search(
        limit => $limit || 10,
        order => 'created desc',
    );
    $comments;
}

# ここではやってないけど、なんかバリデーションとかしてね☆
sub post_comment {
    my ($self, %args) = @_;
    my $comment = GuestBook::Model::GuestBook->create(
        name => $args{name}       || '',
        comment => $args{comment} || '',
    );
    $comment;
}

!!1;
