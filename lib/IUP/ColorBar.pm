package IUP::ColorBar;
use strict;
use warnings;
use base 'IUP::Internal::Element';
use IUP::Internal::LibraryIup;

sub _create_element {
  #my ($self, $args, $firstonly) = @_;
  return IUP::Internal::LibraryIup::_IupColorbar();
}

1;
