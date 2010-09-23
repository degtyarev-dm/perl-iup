#!/usr/bin/env perl

# BEWARE: this is a generated file, DO NOT EDIT THIS FILE MANUALLY!!!

package IUP::Internal::Callback;

use strict;
use warnings;
require DynaLoader;
our @ISA = qw/ DynaLoader /;

bootstrap IUP::Internal::Callback;

my $cb_table = {
  'IUP::Button' => {
    ACTION => \&_init_cb_ACTION_,
    BUTTON_CB => \&_init_cb_BUTTON_CB_iiiis,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Canvas' => {
    ACTION => \&_init_cb_ACTION_ff,
    BUTTON_CB => \&_init_cb_BUTTON_CB_iiiis,
    DROPFILES_CB => \&_init_cb_DROPFILES_CB_siii,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    FOCUS_CB => \&_init_cb_FOCUS_CB_i,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KEYPRESS_CB => \&_init_cb_KEYPRESS_CB_ii,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOTION_CB => \&_init_cb_MOTION_CB_iis,
    RESIZE_CB => \&_init_cb_RESIZE_CB_ii,
    SCROLL_CB => \&_init_cb_SCROLL_CB_iff,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    WHEEL_CB => \&_init_cb_WHEEL_CB_fiis,
    WOM_CB => \&_init_cb_WOM_CB_i,
  },
  'IUP::Cells' => {
    DRAW_CB => \&_init_cb_DRAW_CB_iiiiiiv,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HEIGHT_CB => \&_init_cb_HEIGHT_CB_i,
    HELP_CB => \&_init_cb_HELP_CB_,
    HSPAN_CB => \&_init_cb_HSPAN_CB_ii,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOUSECLICK_CB => \&_init_cb_MOUSECLICK_CB_iiiiiis,
    MOUSEMOTION_CB => \&_init_cb_MOUSEMOTION_CB_iiiis,
    NCOLS_CB => \&_init_cb_NCOLS_CB_,
    NLINES_CB => \&_init_cb_NLINES_CB_,
    SCROLLING_CB => \&_init_cb_SCROLLING_CB_ii,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VSPAN_CB => \&_init_cb_VSPAN_CB_ii,
    WIDTH_CB => \&_init_cb_WIDTH_CB_i,
  },
  'IUP::ColorBrowser' => {
    CHANGE_CB => \&_init_cb_CHANGE_CB_ccc,
    DRAG_CB => \&_init_cb_DRAG_CB_ccc,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
  'IUP::ColorDlg' => {
    HELP_CB => \&_init_cb_HELP_CB_,
  },
  'IUP::Colorbar' => {
    CELL_CB => \&_init_cb_CELL_CB_i,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    EXTENDED_CB => \&_init_cb_EXTENDED_CB_i,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    SELECT_CB => \&_init_cb_SELECT_CB_ii,
    SWITCH_CB => \&_init_cb_SWITCH_CB_ii,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Dial' => {
    BUTTON_PRESS_CB => \&_init_cb_BUTTON_PRESS_CB_d,
    BUTTON_RELEASE_CB => \&_init_cb_BUTTON_RELEASE_CB_d,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOUSEMOVE_CB => \&_init_cb_MOUSEMOVE_CB_d,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
  'IUP::Dialog' => {
    CLOSE_CB => \&_init_cb_CLOSE_CB_,
    COPYDATA_CB => \&_init_cb_COPYDATA_CB_si,
    DROPFILES_CB => \&_init_cb_DROPFILES_CB_siii,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MDIACTIVATE_CB => \&_init_cb_MDIACTIVATE_CB_,
    MOVE_CB => \&_init_cb_MOVE_CB_ii,
    RESIZE_CB => \&_init_cb_RESIZE_CB_ii,
    SHOW_CB => \&_init_cb_SHOW_CB_i,
    TRAYCLICK_CB => \&_init_cb_TRAYCLICK_CB_iii,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::FileDlg' => {
    FILE_CB => \&_init_cb_FILE_CB_ss,
    HELP_CB => \&_init_cb_HELP_CB_,
  },
  'IUP::FontDlg' => {
    HELP_CB => \&_init_cb_HELP_CB_,
  },
  'IUP::Frame' => {
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::GLCanvas' => {
    RESIZE_CB => \&_init_cb_RESIZE_CB_ii,
  },
  'IUP::Item' => {
    ACTION => \&_init_cb_ACTION_,
    HELP_CB => \&_init_cb_HELP_CB_,
    HIGHLIGHT_CB => \&_init_cb_HIGHLIGHT_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Label' => {
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::List' => {
    ACTION => \&_init_cb_ACTION_sii,
    BUTTON_CB => \&_init_cb_BUTTON_CB_iiiis,
    CARET_CB => \&_init_cb_CARET_CB_iii,
    DBLCLICK_CB => \&_init_cb_DBLCLICK_CB_is,
    DROPDOWN_CB => \&_init_cb_DROPDOWN_CB_i,
    DROPFILES_CB => \&_init_cb_DROPFILES_CB_siii,
    EDIT_CB => \&_init_cb_EDIT_CB_is,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOTION_CB => \&_init_cb_MOTION_CB_iis,
    MULTISELECT_CB => \&_init_cb_MULTISELECT_CB_s,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
  'IUP::Matrix' => {
    ACTION_CB => \&_init_cb_ACTION_CB_iiiis,
    BGCOLOR_CB => \&_init_cb_BGCOLOR_CB_iiIII,
    CLICK_CB => \&_init_cb_CLICK_CB_iis,
    DRAW_CB => \&_init_cb_DRAW_CB_iiiiiiv,
    DROPCHECK_CB => \&_init_cb_DROPCHECK_CB_ii,
    DROPSELECT_CB => \&_init_cb_DROPSELECT_CB_iinsii,
    DROP_CB => \&_init_cb_DROP_CB_nii,
    EDITION_CB => \&_init_cb_EDITION_CB_iiii,
    ENTERITEM_CB => \&_init_cb_ENTERITEM_CB_ii,
    FGCOLOR_CB => \&_init_cb_FGCOLOR_CB_iiIII,
    FONT_CB => \&_init_cb_FONT_CB_ii,
    LEAVEITEM_CB => \&_init_cb_LEAVEITEM_CB_ii,
    MARKEDIT_CB => \&_init_cb_MARKEDIT_CB_iii,
    MARK_CB => \&_init_cb_MARK_CB_ii,
    MOUSEMOVE_CB => \&_init_cb_MOUSEMOVE_CB_ii,
    RELEASE_CB => \&_init_cb_RELEASE_CB_iis,
    SCROLLTOP_CB => \&_init_cb_SCROLLTOP_CB_ii,
    VALUE_CB => \&_init_cb_VALUE_CB_ii,
    VALUE_EDIT_CB => \&_init_cb_VALUE_EDIT_CB_iis,
  },
  'IUP::Menu' => {
    MAP_CB => \&_init_cb_MAP_CB_,
    MENUCLOSE_CB => \&_init_cb_MENUCLOSE_CB_,
    OPEN_CB => \&_init_cb_OPEN_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::MessageDlg' => {
    HELP_CB => \&_init_cb_HELP_CB_,
  },
  'IUP::OleControl' => {
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::PPlot' => {
    DELETEBEGIN_CB => \&_init_cb_DELETEBEGIN_CB_,
    DELETEEND_CB => \&_init_cb_DELETEEND_CB_,
    DELETE_CB => \&_init_cb_DELETE_CB_iiff,
    EDITBEGIN_CB => \&_init_cb_EDITBEGIN_CB_,
    EDITEND_CB => \&_init_cb_EDITEND_CB_,
    EDIT_CB => \&_init_cb_EDIT_CB_iiffFF,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    POSTDRAW_CB => \&_init_cb_POSTDRAW_CB_v,
    PREDRAW_CB => \&_init_cb_PREDRAW_CB_v,
    SELECTBEGIN_CB => \&_init_cb_SELECTBEGIN_CB_,
    SELECTEND_CB => \&_init_cb_SELECTEND_CB_,
    SELECT_CB => \&_init_cb_SELECT_CB_iiffi,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::ProgressBar' => {
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Spin' => {
    SPIN_CB => \&_init_cb_SPIN_CB_i,
  },
  'IUP::Spinbox' => {
    SPIN_CB => \&_init_cb_SPIN_CB_i,
  },
  'IUP::Submenu' => {
    HIGHLIGHT_CB => \&_init_cb_HIGHLIGHT_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Tabs' => {
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    TABCHANGE_CB => \&_init_cb_TABCHANGE_CB_nn,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Text' => {
    ACTION => \&_init_cb_ACTION_is,
    BUTTON_CB => \&_init_cb_BUTTON_CB_iiiis,
    CARET_CB => \&_init_cb_CARET_CB_iii,
    DROPFILES_CB => \&_init_cb_DROPFILES_CB_siii,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOTION_CB => \&_init_cb_MOTION_CB_iis,
    SPIN_CB => \&_init_cb_SPIN_CB_i,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
  'IUP::Timer' => {
    ACTION_CB => \&_init_cb_ACTION_CB_,
  },
  'IUP::Toggle' => {
    ACTION => \&_init_cb_ACTION_i,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
  'IUP::Tree' => {
    BRANCHCLOSE_CB => \&_init_cb_BRANCHCLOSE_CB_i,
    BRANCHOPEN_CB => \&_init_cb_BRANCHOPEN_CB_i,
    BUTTON_CB => \&_init_cb_BUTTON_CB_iiiis,
    DRAGDROP_CB => \&_init_cb_DRAGDROP_CB_iiii,
    DROPFILES_CB => \&_init_cb_DROPFILES_CB_siii,
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    EXECUTELEAF_CB => \&_init_cb_EXECUTELEAF_CB_i,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    MOTION_CB => \&_init_cb_MOTION_CB_iis,
    MULTISELECTION_CB => \&_init_cb_MULTISELECTION_CB_Ai,
    MULTIUNSELECTION_CB => \&_init_cb_MULTIUNSELECTION_CB_Ai,
    NODEREMOVED_CB => \&_init_cb_NODEREMOVED_CB_s,
    RENAME_CB => \&_init_cb_RENAME_CB_is,
    RIGHTCLICK_CB => \&_init_cb_RIGHTCLICK_CB_i,
    SELECTION_CB => \&_init_cb_SELECTION_CB_ii,
    SHOWRENAME_CB => \&_init_cb_SHOWRENAME_CB_i,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
  },
  'IUP::Val' => {
    ENTERWINDOW_CB => \&_init_cb_ENTERWINDOW_CB_,
    GETFOCUS_CB => \&_init_cb_GETFOCUS_CB_,
    HELP_CB => \&_init_cb_HELP_CB_,
    KILLFOCUS_CB => \&_init_cb_KILLFOCUS_CB_,
    K_ANY => \&_init_cb_K_ANY_i,
    LEAVEWINDOW_CB => \&_init_cb_LEAVEWINDOW_CB_,
    MAP_CB => \&_init_cb_MAP_CB_,
    UNMAP_CB => \&_init_cb_UNMAP_CB_,
    VALUECHANGED_CB => \&_init_cb_VALUECHANGED_CB_,
  },
};

sub _execute_cb_cnv1 {
  my ($ih, $action, $cnv) = @_;
  my $ref = _translate_ih($ih);
  return -1 unless ref($ref);
  my $func = $ref->{$action};
  return -1 unless (ref($func) eq 'CODE');
  
  #xxx TODO xxx translate $cnv via global register (not available yet)
  $cnv = undef;
  
  my $rv = &$func($ref, $cnv);
  return -1 unless defined $rv;
  return $rv;
}

sub _execute_cb { #TODO: maybe return something else then -1 in case of error
  my ($ih, $action, @args) = @_;
  my $ref = _translate_ih($ih);
  return -1 unless ref($ref);
  my $func = $ref->{$action};
  return -1 unless (ref($func) eq 'CODE');
  my $rv = &$func($ref, @args);
  return -1 unless defined $rv;
  return $rv;
}

sub _get_cb_init_function {
  my ($pkg, $action) = @_;
  my $rv = $cb_table->{$pkg};
  return $rv ? $rv->{$action} : undef;
}

sub _is_cb_valid {
  my ($pkg, $action) = @_;
  my $h = $cb_table->{$pkg};
  return 0 unless defined($h);
  return defined($h->{$action}) ? 1 : 0;
}

sub _get_cb_list {
  my ($element) = @_;
  my $h = $cb_table->{$element} or return;
  return keys %$h;
}

#TODO: maybe something more thread safe
my %ih_register; #global table mapping IUP Ihandles to perl objrefs
sub _translate_ih  { $ih_register{$_[0]} }         #params: ih
sub _unregister_ih { delete $ih_register{$_[0]} }  #params: ih
sub _register_ih   { $ih_register{$_[0]} = $_[1] } #params: ih, objref

1;

__END__

=head1 NAME

IUP::Internal::Callback - INTERNAL FUNCTIONS, do not use them from outside!

=cut
