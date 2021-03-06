# IUP::ProgressBar example

use strict;
use warnings;

use IUP ':all';

my $increment = 0.01;

my $pixmap_play = [
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
];

my $pixmap_restart = [
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
];

my $pixmap_rewind = [
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,2,2,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,2,1,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,1,1,1,1,2,1,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,2,2,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
];

my $pixmap_forward = [
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,2,2,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,1,2,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,1,2,1,1,1,1,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,1,2,2,1,1,1,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
];

my $pixmap_pause = [
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
  [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
];

# some elements needs to be declared before callback that make use of them

my $img_restart = IUP::Image->new( pixels=>$pixmap_restart, 1=>"0 0 0", 2=>"BGCOLOR" );
my $img_play    = IUP::Image->new( pixels=>$pixmap_play, 1=>"0 0 0", 2=>"BGCOLOR" );
my $img_forward = IUP::Image->new( pixels=>$pixmap_forward, 1=>"0 0 0", 2=>"BGCOLOR" );
my $img_rewind  = IUP::Image->new( pixels=>$pixmap_rewind, 1=>"0 0 0", 2=>"BGCOLOR" );
my $img_pause   = IUP::Image->new( pixels=>$pixmap_pause, 1=>"0 0 0", 2=>"BGCOLOR" );

my $timer = IUP::Timer->new( ACTION_CB=>\&time_cb, TIME=>100 );

my $progressbar1 = IUP::ProgressBar->new( EXPAND=>"YES", DASHED=>"NO", MARQUEE=>"YES" ); #xxxFIXME MARQUEE not working
my $progressbar2 = IUP::ProgressBar->new( ORIENTATION=>"VERTICAL", 
                                          BGCOLOR=>"255 0 128", 
					  FGCOLOR=>"0 128 0", 
					  RASTERSIZE=>"30x100", 
					  MAX=>50, 
					  VALUE=>25 );
 
my $btn_restart    = IUP::Button->new( IMAGE=>$img_restart, ACTION=>\&btn_restart_cb );
my $btn_pause      = IUP::Button->new( IMAGE=>$img_pause, TIP=>"Play/Pause", TIP=>"Restart", ACTION=>\&btn_pause_cb );
my $btn_accelerate = IUP::Button->new( IMAGE=>$img_forward, TIP=>"Accelerate", ACTION=>\&btn_accelerate_cb );
my $btn_decelerate = IUP::Button->new( IMAGE=>$img_rewind, TIP=>"Decelerate", ACTION=>\&btn_decelerate_cb );
my $btn_show1      = IUP::Button->new( TITLE=>"Dashed", TIP=>"Dashed or Continuous", ACTION=>\&btn_show1_cb );
my $btn_show2      = IUP::Button->new( TITLE=>"Marquee", TIP=>"Marquee or Defined", ACTION=>\&btn_show2_cb );

sub time_cb {
  my $value;

  $value = $progressbar1->VALUE;
  $value += $increment;
  $value = 0 if $value > 1; # start over
  $progressbar1->VALUE($value);

  $value = $progressbar2->VALUE;
  $value += $increment*50;
  $value = 0 if $value > 50; # start over
  $progressbar2->VALUE($value);

  return IUP_DEFAULT;
}

sub btn_pause_cb {
  if (uc($timer->RUN) ne "YES") {
    $timer->RUN("YES");
    $btn_pause->IMAGE($img_pause);
  }
  else {
    $timer->RUN("NO");
    $btn_pause->IMAGE($img_play);
  }  
  return IUP_DEFAULT;
}

sub btn_restart_cb {
  $progressbar1->VALUE(0);
  $progressbar2->VALUE(0);
  return IUP_DEFAULT;
}

sub btn_accelerate_cb {
  $increment *= 2;
  return IUP_DEFAULT;
}

sub btn_decelerate_cb {
  $increment /= 2;
  return IUP_DEFAULT;
}

sub btn_show1_cb {
  warn "DASHED=", $progressbar1->DASHED, "\n"; #NOTE: DASHED is creation only in Windows (so no effect)
  if (uc($progressbar1->DASHED) ne "YES") {
    $progressbar1->DASHED("YES");
  }
  else {
    $progressbar1->DASHED("NO");
  }
  return IUP_DEFAULT;
}

sub btn_show2_cb {
  warn "MARQUEE=", $progressbar1->MARQUEE || '<undef>', "\n"; #xxxFIXME returns undef
  if (uc($progressbar1->MARQUEE) ne "YES") {
    $progressbar1->MARQUEE("YES");
  }
  else {
    $progressbar1->MARQUEE("NO");
  }
  return IUP_DEFAULT;
}

my $hbox = IUP::Hbox->new( child=>[
                             IUP::Fill->new(), 
			     $btn_pause,
			     $btn_restart,
			     $btn_decelerate,
			     $btn_accelerate,
			     $btn_show1,
			     $btn_show2,
			     IUP::Fill->new()] );

my $vbox = IUP::Hbox->new( child=>[ IUP::Vbox->new([$progressbar1, $hbox]), $progressbar2 ],
                           MARGIN=>"10x10", GAP=>5 );

my $dlg = IUP::Dialog->new( child=>$vbox, TITLE=>"IUP::ProgressBar Test");

  
$dlg->ShowXY(IUP_CENTER, IUP_CENTER);
$timer->RUN("YES");

IUP->MainLoop();
