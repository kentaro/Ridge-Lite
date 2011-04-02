package Ridge::Lite::Action;
use strict;
use warnings;

use Ridge::Lite::Engine;

sub install {
    my ($class, $action, $method, $view, $code) = @_;
    my $method_action = join '_', '', $action, lc $method;

    if (!$class->can($method_action)) {
        no strict 'refs';
        no warnings 'redefine';
        *{"$class\::$method_action"} = ($code || sub {});
    }

    if (!Ridge::Lite::Engine->can($action)) {
        eval <<"EOS";
package Ridge::Lite::Engine;
sub $action : Public {
    my (\$self, \$r) = \@_;
    \$r->follow_method;
}
EOS
    }

    eval <<"EOS";
package Ridge::Lite::Engine;
no warnings 'redefine';
sub $method_action {
    my (\$self, \$r) = \@_;
    @{[$view && "\$r->view->available(q{$view});"]}
    Ridge::Lite::Action::$method_action(\$r);
}
EOS
}

!!1;
