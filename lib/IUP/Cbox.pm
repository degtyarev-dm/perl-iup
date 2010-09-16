#!/usr/bin/env perl

package IUP::Cbox;
use strict;
use warnings;
use base 'IUP::Internal::Element';
use IUP::Internal::LibraryIUP;

sub _create_element {
  my ($self, $args, $firstonly) = @_;
  my $ih;
  if (defined $firstonly) {
    if (ref($firstonly) eq 'ARRAY') {
      $ih = IUP::Internal::LibraryIUP::_IupCbox(@$firstonly);
    }
    else {
      $ih = IUP::Internal::LibraryIUP::_IupCbox($firstonly);
    }
  }
  elsif (defined $args && defined $args->{child}) {
    if (ref($args->{child}) eq 'ARRAY') {
      my @list = map ($_->ihandle, @{$args->{child}});
      $ih = IUP::Internal::LibraryIUP::_IupCbox(@list);
    }
    else {
      $ih = IUP::Internal::LibraryIUP::_IupCbox($args->{child}->ihandle);
    }
    delete $args->{child};
  }
  else {
    $ih = IUP::Internal::LibraryIUP::_IupCbox();
  }
  return $ih;
}

1;