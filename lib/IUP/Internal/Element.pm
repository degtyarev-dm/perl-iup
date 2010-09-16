#!/usr/bin/env perl

package IUP::Internal::Element;

use strict;
use warnings;

use IUP::Internal::LibraryIUP;
use IUP::Internal::Callback;
use IUP::Internal::Attribute;
use Carp;

sub new {
  my $class = shift;
  my $argc = scalar @_;
  my %args = ();
  my $firstonly;
  
  my $self = { class => $class };
  bless($self, $class);

  if ($argc == 1) {
    $firstonly = $_[0];
  }
  elsif ($argc > 1 && $argc % 2 == 0) {
    %args = @_ ;
  }
  elsif ($argc > 0) {
    carp "Warning: $class->new() invalid arguments (argc=$argc), ignoring all parameters";
  }
  
  $self->ihandle($self->_create_element(\%args, $firstonly));
  unless ($self->ihandle) {
    carp "Error: $class->new() failed";
    return;
  }
  my @cb;
  my @at;
  for (keys %args) {
    if ($self->IsValidAttributeName($_)) {
      push(@at, $_, $args{$_});
    }
    elsif ($self->IsValidCallbackName($_)) {
      push(@cb, $_, $args{$_});
    }    
    elsif ($_ eq 'name') {
      $self->name($args{$_});
    }
    else {
      carp "Warning: $class->new() ignoring illegal parameter '$_' ($class)";
    }
  }
  $self->SetAttribute(@at) if scalar(@at);
  $self->SetCallback(@cb) if scalar(@cb);
  if (!$self->HasValidClassName) {
    my $c = $_[0]->GetClassName || '';
    carp "Warning: $class->new() classname mismatch '$class' vs. '$c'";
  }
  return $self;
}

sub new_no_ihandle {
  my $class = shift;
  my $self = { class => $class };
  bless($self, $class);
  return $self;
}

sub new_from_ihandle {
  my ($class, $ih) = @_;
  my $self = { class => $class };
  bless($self, $class);
  $self->ihandle($ih);
  if (!$self->HasValidClassName) {
    my $c = $_[0]->GetClassName || '';
    carp "Warning: $class->new_from_ihandle() classname mismatch '$class' vs. '$c'";
  }
  return $self;
}

# accessor
sub ihandle {
  if ($_[1]) {
    IUP::Internal::Callback::_register_ih($_[1], $_[0]);    
    return $_[0]->{___ihandle} = $_[1]
  }
  else {
    return $_[0]->{___ihandle};
  }
}

# accessor
sub name {
  if ($_[1]) {
    #Ihandle *IupSetHandle(const char *name, Ihandle *ih); [in C]
    #iup.SetHandle(name: string, ih: ihandle) -> old_ih: ihandle [in Lua]
    return IUP::Internal::LibraryIUP::_IupSetHandle($_[1], $_[0]->ihandle);    
  }
  else {
    #char* IupGetName(Ihandle* ih); [in C]
    #iup.GetName(ih: ihandle) -> (name: string) [in Lua]
    return IUP::Internal::LibraryIUP::_IupGetName($_[0]->ihandle);    
  }
}

sub import {
  my $p = shift;
  my @cb_list = IUP::Internal::Callback::_get_cb_list($p);
  my @attrib_list = IUP::Internal::Attribute::_get_attr_list($p);
  my @param_list = qw/ihandle cnvhandle/;

  for (@cb_list) {
    next if defined *{"$p\::$_"};
    #warn "creating.c: $p\::$_";
    eval "*$p\::$_ = sub { return \$_[1] ? \$_[0]->SetCallback('$_', \$_[1]) : \$_[0]->{$_} }"; #TODO: rw does not make much sense
  }
  
  for (@attrib_list) {
    next if defined *{"$p\::$_"};
    #warn "creating.a: $p\::$_";
    eval "*$p\::$_ = sub { return \$_[1] ? \$_[0]->SetAttribute('$_', \$_[1]) : \$_[0]->GetAttribute('$_') }";
  }
  
  #for (@param_list) {
  #  next if defined *{"$p\::$_"};
  #  #warn "creating.p: $p\::$_";
  #  eval "*$p\::$_ = sub { return \$_[1] ? \$_[0]->{___$_} = \$_[1] : \$_[0]->{___$_} }";
  #}
}

sub SetAttribute {
  #void IupSetAttribute(Ihandle *ih, const char *name, const char *value); [in C]
  #iup.SetAttribute(ih: iulua_tag, name: string, value: string) [in Lua]   
  #void IupStoreAttribute(Ihandle *ih, const char *name, const char *value); [in C]
  #iup.StoreAttribute(ih: iulua_tag, name: string, value: string) [in Lua] 
  my ($self, %args) = @_;  
  for (keys %args) {    
    my ($k, $v) = ($_, $args{$_});
    if (!$self->IsValidAttributeName($k)) {
      carp "Warning: ignoring illegal attribute '$k' (".ref($self).")";
      next;
    }
    if (ref($v)) {
      IUP::Internal::LibraryIUP::_IupSetAttributeHandle($self->ihandle, $k, $v->ihandle);
    }
    else {
      # xxx TODO SetAttribute vs. StoreAttribute see attrib_guide.html
      #IUP::Internal::LibraryIUP::_IupSetAttribute($self->ihandle, $k, $v);
      IUP::Internal::LibraryIUP::_IupStoreAttribute($self->ihandle, $k, $v);
    }
  }
}

sub GetAttribute {
  #Ihandle* IupGetAttributeHandle(Ihandle *ih, const char *name); [in C]
  #char *IupGetAttribute(Ihandle *ih, const char *name); [in C]
  #iup.GetAttribute(ih: ihandle, name: string) -> value: string [in Lua]
  my ($self, @names) = @_;
  my @rv = ();  
  push(@rv, IUP::Internal::LibraryIUP::_IupGetAttribute($self->ihandle, $_)) for (@names);    
  return (scalar(@names) == 1) ? $rv[0] : @rv; #TODO: not sure if this is a good idea
}

sub SetCallback {
  my ($self, %args) = @_;
  for (keys %args) {
    my ($action, $func) = ($_, $args{$_});    
    my $cb_init_func = IUP::Internal::Callback::_get_cb_init_function(ref($self), $action);
    if (ref($cb_init_func) eq 'CODE') {
      $self->{$action} = $func;
      &$cb_init_func($self->ihandle,$action);
    }
    else {
      carp "Warning: ignoring illegal callback '$action' (".ref($self).")";
    }
  }
}

sub GetCallback {
  my ($self, @names) = @_;
  my @rv = ();  
  push(@rv, $self->IsValidCallbackName($_) ? $self->{$_} : undef) for (@names);    
  return (scalar(@names) == 1) ? $rv[0] : @rv; #TODO: not sure if this is a good idea
}

sub IsValidAttributeName {
  return IUP::Internal::Attribute::_is_attr_valid(ref($_[0]), $_[1]);
}

sub IsValidCallbackName {  
  return IUP::Internal::Callback::_is_cb_valid(ref($_[0]), $_[1]);
}

sub HasValidClassName {  
  my $c = $_[0]->GetClassName || '';
  return lc(ref($_[0])) eq "iup::$c" ? 1 : 0;
}

sub _create_element {
  my ($self, @args) = @_;
  die "Function _create_element() not implemented in IUP::Internal::Element";
}

sub Append {
  #Ihandle* IupAppend(Ihandle* ih, Ihandle* new_child); [in C]
  #iup.Append(ih, new_child: ihandle) -> (parent: ihandle) [in Lua]
  my ($self, $new_child) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupAppend($self->ihandle, $new_child);
  return IUP->GetOrCreateByIhandle($ih);
}

sub ConvertXYToPos {
  #int IupConvertXYToPos(Ihandle *ih, int x, int y); [in C]
  #iup.ConvertXYToPos(ih: ihandle, x, y: number) -> (ret: number) [in Lua]
  #It can be used for IupText (returns a position in the string), IupList (returns an item) or IupTree (returns a node identifier).
  my ($self, $x, $y) = @_;
  return IUP::Internal::LibraryIUP::_IupConvertXYToPos($self->ihandle, $x, $y);
}

sub Destroy {
  #void IupDestroy(Ihandle *ih); [in C]
  #iup.Destroy(ih: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupDestroy($self->ihandle);
}

sub Detach {
  #void IupDetach(Ihandle *child); [in C]
  #iup.Detach(child: ihandle) or child:detach() [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupDetach($self->ihandle);
}

sub GetAllAttributes {
  #int IupGetAllAttributes(Ihandle* ih, char** names, int max_n); [in C]
  #iup.GetAllAttributes(ih: ihandle, max_n: number) -> (names: table, n: number) [in Lua]
  my ($self, $max_n) = @_;
  return IUP::Internal::LibraryIUP::_IupGetAllAttributes($self->ihandle, $max_n);
}

sub GetAttributes {
  #char* IupGetAttributes (Ihandle *ih); [in C]
  #iup.GetAttributes(ih: iulua_tag) -> (ret: string) [in Lua] 
  my $self = shift;
  my $result = { };
    
  # xxx Beware xxx - this fails if value contains , (comma)    
  #my $rv = IUP::Internal::LibraryIUP::_IupGetAttributes($self->ihandle);
  #for (split(',', $rv)) {  
  #  $result->{$1} = $2 if (/^([^=]*)="?(.*?)"?$/)    
  #};  

  # alternative approach
  $result->{$_} = $self->GetAttribute($_) for ($self->GetAllAttributes);

  return $result;
}

sub GetBrother {
  #Ihandle* IupGetBrother(Ihandle* ih); [in C]
  #iup.GetBrother(ih: ihandle) -> brother: ihandle [in Lua]
  my $self = shift;
  my $ih = IUP::Internal::LibraryIUP::_IupGetBrother($self->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetClassName {
  #char* IupGetClassName(Ihandle* ih); [in C]
  #iup.GetClassName(ih: ihandle) -> (name: string) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupGetClassName($self->ihandle);
}

sub GetClassType {
  #char* IupGetClassType(Ihandle* ih); [in C]
  #iup.GetClassType(ih: ihandle) -> (name: string) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupGetClassType($self->ihandle);
}

sub GetChildCount {
  #int IupGetChildCount(Ihandle* ih); [in C]
  #iup.GetChildCount(ih: ihandle) ->  pos: number [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupGetChildCount($self->ihandle);
}

sub Hide {
  #int IupHide(Ihandle *ih); [in C]
  #iup.Hide(ih: ihandle) -> (ret: number) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupHide($self->ihandle);  
}

sub Map {
  #int IupMap(Ihandle* ih); [in C]
  #iup.Map(ih: iuplua-tag) -> ret: number [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupMap($self->ihandle);  
}

sub Popup {
  # xxx Dialog
  #int IupPopup(Ihandle *ih, int x, int y); [in C]
  #iup.Popup(ih: ihandle[, x, y: number]) -> (ret: number) [in Lua]
  #or ih:popup([x, y: number]) -> (ret: number) [in Lua]
  my ($self, $x, $y) = @_;
  return IUP::Internal::LibraryIUP::_IupPopup($self->ihandle, $x, $y);  
}

sub Show {
  # xxx Dialog
  #int IupShow(Ihandle *ih); [in C]
  #iup.Show(ih: ihandle) -> (ret: number) [in Lua]
  #or ih:show() -> (ret: number) [in IupLua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupShow($self->ihandle);
}

sub ShowXY {
  # xxx Dialog
  #int IupShowXY(Ihandle *ih, int x, int y); [in C]
  #iup.ShowXY(ih: ihandle[, x, y: number]) -> (ret: number) [in Lua]
  #or ih:showxy([x, y: number]) -> (ret: number) [in Lua]
  my ($self, $x, $y) = @_;
  return IUP::Internal::LibraryIUP::_IupShowXY($self->ihandle, $x, $y);  
}

sub Redraw {
  #void IupRedraw(Ihandle* ih, int children); [in C]
  #iup.Redraw(ih: ihandle, children: boolen) [in Lua]
  my ($self, $children) = @_;
  return IUP::Internal::LibraryIUP::_IupPopup($self->ihandle, $children);  
}

sub Refresh {
  #void IupRefresh(Ihandle *ih); [in C]
  #iup.Refresh(ih: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupRefresh($self->ihandle);  
}

sub Reparent {
  #void IupReparent(Ihandle* child, Ihandle* parent); [in C]
  #iup.Reparent(child, parent: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupReparent($self->ihandle);  
}

sub ResetAttribute {
  #void IupResetAttribute(Ihandle *ih, const char *name); [in C]
  #iup.ResetAttribute(ih: iulua_tag, name: string) [in Lua] 
  my ($self, $name) = @_;
  return IUP::Internal::LibraryIUP::_IupResetAttribute($self->ihandle, $name);  
}

sub SaveClassAttributes {
  #void IupSaveClassAttributes(Ihandle* ih); [in C]
  #iup.SaveClassAttributes(ih: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupSaveClassAttributes($self->ihandle);  
}

sub SaveImageAsText {
  # xxx Image
  #int IupSaveImageAsText(Ihandle* ih, const char* file_name, const char* format, const char* name); [in C]
  #iup.SaveImageAsText(ih: ihandle, file_name, format[, name]: string) -> (ret: boolean) [in Lua]
  my ($self, $file_name, $format, $name) = @_;
  return IUP::Internal::LibraryIUP::_IupSaveImageAsText($self->ihandle, $file_name, $format, $name);
}

sub SetFocus {
  #Ihandle *IupSetFocus(Ihandle *ih); [in C]
  #iup.SetFocus(ih: ihandle) -> ih: ihandle [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupSetFocus($self->ihandle);  
}

sub Unmap {
  #void IupUnmap(Ihandle* ih); [in C]
  #iup.Unmap(ih: iuplua-tag) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupUnmap($self->ihandle);  
}

sub Update {
  #void IupUpdate(Ihandle* ih); [in C]
  #iup.Update(ih: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupUpdate($self->ihandle);  
}

sub UpdateChildren {
  #void IupUpdateChildren(Ihandle* ih); [in C]
  #iup.UpdateChildren(ih: ihandle) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIUP::_IupUpdateChildren($self->ihandle);  
}

# xxx TODO xxx need to somehow manage ihandle > perlobjref conversion

sub GetNextChild {
  #Ihandle *IupGetNextChild(Ihandle* ih, Ihandle* child); [in C]
  #iup.GetNextChild(ih, child: ihandle) -> next_child: ihandle [in Lua]
  my ($self, $child) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupGetNextChild($self->ihandle, $child);
  return IUP->GetOrCreateByIhandle($ih);
}

sub PreviousField {
  #Ihandle* IupPreviousField(Ihandle* ih); [in C]
  #iup.PreviousField(ih: ihandle) -> (previous: ihandle) [in Lua]
  my $self = shift;
  my $ih = IUP::Internal::LibraryIUP::_IupPreviousField($self->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetChildPos {
  #int IupGetChildPos(Ihandle* ih, Ihandle* child); [in C]
  #iup.GetChildPos(ih, child: ihandle) ->  pos: number [in Lua]
  my ($self, $child) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupGetChildPos($self->ihandle, $child->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetDialog {
  #Ihandle* IupGetDialog(Ihandle *ih); [in C]
  #iup.GetDialog(ih: ihandle) -> (ih: ihandle) [in Lua]
  my $self = shift;
  my $ih = IUP::Internal::LibraryIUP::_IupGetDialog($self->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetDialogChild {
  # xxx TODO maybe Dialog only
  #Ihandle* IupGetDialogChild(Ihandle *ih, const char* name); [in C]
  #iup.GetDialogChild(ih: ihandle, name: string) -> (ih: ihandle) [in Lua]
  my ($self, $name) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupGetDialogChild($self->ihandle, $name);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetChild {
  #Ihandle *IupGetChild(Ihandle* ih, int pos); [in C]
  #iup.GetChild(ih: ihandle, pos: number) -> child: ihandle [in Lua]
  my ($self, $pos) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupGetChild($self->ihandle, $pos);
  return IUP->GetOrCreateByIhandle($ih);
}

sub GetParent {
  #Ihandle* IupGetParent(Ihandle *ih); [in C]
  #iup.GetParent(ih: ihandle) -> parent: ihandle [in Lua]
  my $self = shift;
  my $ih = IUP::Internal::LibraryIUP::_IupGetParent($self->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub Insert {
  #Ihandle* IupInsert(Ihandle* ih, Ihandle* ref_child, Ihandle* new_child); [in C]
  #iup.Append(ih, ref_child, new_child: ihandle) -> (parent: ihandle) [in Lua]
  my ($self, $ref_child, $new_child) = @_;
  my $ih = IUP::Internal::LibraryIUP::_IupInsert($self->ihandle, $ref_child, $new_child);
  return IUP->GetOrCreateByIhandle($ih);
}

sub NextField {
  #Ihandle* IupNextField(Ihandle* ih); [in C]
  #iup.NextField(ih: ihandle) -> (next: ihandle) [in Lua]
  my $self = shift;
  my $ih = IUP::Internal::LibraryIUP::_IupNextField($self->ihandle);
  return IUP->GetOrCreateByIhandle($ih);
}

sub DESTROY {
  # xxx TODO see http://perldoc.perl.org/perlobj.html
  #warn "XXX Destroying " . ref($_[0]) . " [" . $_[0]->ihandle . "]";
  IUP::Internal::Callback::_unregister_ih($_[0]->ihandle);
  $_[0]->Destroy;
}

1;

__END__

=head1 NAME

IUP::Internal::Element - Perl extension for IUP xxx

=cut