use strict;
use warnings;

use SearchMusic;

my $app = SearchMusic->apply_default_middlewares(SearchMusic->psgi_app);
$app;

