package Ridge::Lite::Action;
use strict;
use warnings;

use Ridge::Lite::Engine;

sub install {
    my ($class, $action, $view, $code) = @_;

    if (!$class->can($action)) {
        no strict 'refs';
        no warnings 'redefine';
        *{"$class\::$action"} = ($code || sub {});
    }

    if (!Ridge::Lite::Engine->can($action)) {
        eval <<"EOS";
package Ridge::Lite::Engine;
no warnings 'redefine';
sub $action : Public {
    my (\$self, \$r) = \@_;
    @{[$view && '\$r->view->available(q{json});']}
    Ridge::Lite::Action::${action}(\$r);
}
EOS
    }
}

!!1;
