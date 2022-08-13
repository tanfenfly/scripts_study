#!/usr/bin/perl


use strict;
use Data::Dumper;
use vars qw(%hash2 %hash1 @arry1 $G1 $GD1);
printf("hello world\n");
# perldoc perldoc
#https://perldoc.perl.org/perlintro
#https://perldoc.perl.org/perl#Tutorials  = include all index to perl help
# https://perldoc.perl.org/perldsc  =
#{{{1 basic structure
if (0) { #just used to remove some logs
#{{{2 scalars
printf("_______ scalar : L%u\n",__LINE__);
my $a1=10;
if($a1<20){ printf("L%u : a1<20\n",__LINE__); } 
else { printf("L%u : a1>20\n",__LINE__); }

my $a2="Hello";
if( $a2 =~ /e.*/ ) { printf("L%u : match \n",__LINE__); } 
else { printf("L%u : NotMatch \n",__LINE__); }

print Dumper($a2); print Dumper(\$a2);
#2}}} scalars
#{{{2 array
printf("_______ array : L%u\n",__LINE__);

my @b1=(11, 22, 33);
print "L",__LINE__, " : b1= @b1 ", "\n";

my @b2=(11, 22, "abc"); # array can be mixed with number and string
print "L",__LINE__, " : b2= @b2 ", "\n";

my @b3=(11, "abc", @b2); # elemem can be array
print "L",__LINE__, " : b3= @b3 ", "\n";

my @b4=(11, "abc", \@b2 ); # elemem can mix type
print "L",__LINE__, " : b4= @b4 ", "\n";

my @b5 = (10..20);
my $b5_size1=@b5;
my $b5_size2=scalar(@b5);
print "L",__LINE__, " : b5= @b5 ", "\n";
printf("L%u: size1=%u size2=%u lastIdx=%u  \n",__LINE__, $b5_size1 , $b5_size2 , $#b5 );
printf("L%u: b5[0]=%u, b5[-1]=%u, \n",__LINE__, $b5[0], $b5[-1] );

print @b1," = @b1 \n";
print Dumper(\@b1);
#2}}} array
#{{{2 hash
printf("_______ hash : L%u\n",__LINE__);
my %h1;
$h1{"kh1"}="name_h1_1"; $h1{"kh2"}="name_h1_2";
print %h1 , "\n" ; print Dumper(\%h1);

my %h2=(
  "kh1" => "name_h2_1",
  "kh2" => "name_h2_2",
);
print Dumper(\%h2);
print "L",__LINE__, " : h2{kh1} = $h2{'kh1'} ", "\n";
$h2{"kh1"} = "newVal_01" ; 
print Dumper(\%h2);

#2}}} hash
#{{{2 reference
printf("_______ reference: L%u\n",__LINE__);

my $ds1=100;
my $r1=\$ds1;
printf("L%u : (type,refVal,Val)=(%s , %s , %s) \n ", __LINE__, ref($r1) ,$r1 , $$r1 );

my @da1= (11..15) ;
my $r2=\@da1;
printf("L%u : (type,refVal,Val)=(%s , %s , %s) \n ", __LINE__, ref($r2) ,$r2 , join(" ",@$r2) );
$r2->[0]=7788;
($r2)->[1]=9876;
print Dumper(\@da1);


my %dh1=(
  "k1" => "v1",
  "k2" => "v2",
  "k3" => "v3",
);
my $r3=\%dh1;
printf("L%u : (type,refVal,Val)=(%s , %s , %s) \n ", __LINE__, ref($r3) ,$r3 , join(" ",%$r3) );
$r3->{'k1'} = 'v991';
($r3)->{'k2'} = 'v992';
print Dumper(\%dh1);

#2}}} reference
}
#1}}}
#{{{1 array operations
my @ea1 = (13..15, 16) ;
my $es1;
my $es2;
my @ea2 ;

if (0) { #just used to remove some logs
#{{{2 array as : fifo + queue
push(@ea1,17);    push(@ea1,(18,19));    #add to end
unshift(@ea1,12); unshift(@ea1,(10,11)); #add to head
$es1=pop ( @ea1 ) ;  #remove last and return
$es1=shift( @ea1 ) ; #remove first and return
#2}}}
#{{{2 child array
@ea1 = (10..15);
my @ea1_sub_array = @ea1[0,3,5];
splice( @ea1, 0,3, (100..102) ); # spliace(@array, startIdx,Length,  NewInsertedArray);
#2}}}
#{{{2 string <--> Array : transfer
$es1="x1,x2,x3";
@ea1 = split (/,/,$es1);
$es2 = join ('-', @ea1 );
#2}}}
#{{{2 sort
@ea1 = (50..53, 3, 9);
@ea2 = sort( @ea1 ); #sort as ASCII string
sub sub01_compare_number { 
  if($_[1]>$_[0]){return -1;}
  elsif($_[1]==$_[0]){return 0;}
  else{return 1;}
}
@ea2 = sort  sub01_compare_number @ea1 ; print "L", __LINE__, ": " ,Dumper(\@ea2);#no change

sub sub02_compare_number { $a <=> $b }
@ea2 = sort  sub02_compare_number @ea1 ; print "L", __LINE__, ": " ,Dumper(\@ea2);

sub sub03_compare_number_high2low  { 
  if(($a-$b)>0){return -1;} elsif(($a-$b)==0){return 0;} else{return 1;}
}
@ea2 = sort  sub03_compare_number_high2low @ea1 ; print "L", __LINE__, ": " ,Dumper(\@ea2);

sub sub04_compare_number_high2low  { 
  if(($a-$b)>0){return 1;} elsif(($a-$b)==0){return 0;} else{return -1;}
}
@ea2 = sort  sub04_compare_number_high2low @ea1 ; print "L", __LINE__, ": " ,Dumper(\@ea2);
#2}}} 
#{{{2 for interation array
@ea1=(10..12);
for my $i (@ea1) { printf("L%u : %u \n",__LINE__,$i); } 
for (my $i=0; $i<=$#ea1; $i++ ) { printf("L%u : %u \n",__LINE__,$ea1[$i]); } 
#2}}}
#print Dumper($es2);
#print Dumper(\@ea1);
}
#1}}}
#{{{1 hash operations
my @fa1;
#my %fh1 = { "k1" => "v1", "k2" => "v2", "k3" => "v3", } ; #Error
my %fh1 = ( "k1" => "v1", "k2" => "v2", "k3" => "v3", ) ; #ok

if (0) { #just used to remove some logs
#{{{2 all keys/values of hash
my @fh1_part_values = @fh1{'k1','k3'};
my @fh1_all_keys = keys (%fh1);
my @fh1_all_values = values (%fh1);
my $fh1_size = keys ( %fh1 );
   $fh1_size = values ( %fh1 );
#2}}}
#{{{2 check element whether exists
printf("L%u: %u \n",__LINE__,$fh1_size);
if ( exists($fh1{'k1'}) ) { printf("L%u: k1 exist \n",__LINE__); }
if ( exists($fh1{'k9'}) ) { printf("L%u: k9 exist \n",__LINE__); } else { printf("L%u: k9 not exist \n",__LINE__); }
#2}}}
#{{{2 add/remove element of hash
$fh1{'k4'} = 'v4' ; 
delete $fh1{'k1'};
#2}}}
#{{{2 for/while interation of hash
foreach my $fs1 (sort keys(%fh1)) {
  printf("L%u: (key,value)=(%s,%s) \n",__LINE__, $fs1 , $fh1{$fs1});
}

while ( my ($k,$v) = each(%fh1)) {
  printf("L%u: k,v=$k,$v\n",__LINE__);
}
#2}}}
printf("L%u:\n",__LINE__);
print Dumper(\@fa1);
print Dumper(\@fh1_all_values);
print Dumper(\%fh1);
}
#1}}}
#{{{1 operators 
my $g1;
my $g2;
my $g3;

if (0) { #just used to remove some logs
#{{{2 + - * /
$g1=10;       $g2=20;        $g3 = $g1 + $g2 ;
$g1=0x10;     $g2=0x20;      $g3 = $g1 + $g2 ;
$g1="0x10";   $g2=0x20;      $g3 = hex($g1) + $g2 ;
$g1=10;       $g2=20;        $g3 = $g1 - $g2 ;
$g1=10;       $g2=20;        $g3 = $g1 * $g2 ;
$g1="10";     $g2=20;        $g3 = $g1 * $g2 ;
$g1="10";     $g2=20;        $g3 = $g1 x $g2 ; #used as string duplicate
#2}}}
#{{{2 number compare : > < == != >= <= <=>
$g1=10;$g2=20;
if    ( $g1 >  $g2 )  { $g3=1; }
elsif ( $g1 == $g2)   { $g3=0; }
else { $g3=-1; }
$g3 = ($g1<=>$g2);
#2}}}
#{{{2 string compare: lt/gt + ge/le/eq/ne + cmp
$g1="abc"; $g2="def";
if    ( $g1 eq $g2 ) { $g3="Equal"; }
elsif ( $g1 gt $g2 ) { $g3="gt"; }
elsif ( $g1 lt $g2 ) { $g3="lt"; }
$g3 = ( $g1 cmp $g2 );
#2}}}
#{{{2 bit operation:  | & ^ >> <<
$g1=0x03; $g2=0x0f;
$g1=0b0011_0011; $g2=0b1100;
$g3= $g1 | $g2;
$g3= $g1 & $g2;
$g3= $g1 ^ $g2;
$g3= ((5<<2)>>1);

#2}}}
#{{{2 logcal and/or/not  && || 
if ((5>3) && (2<5)) { $g3="ok" ; }
if ( 1 and 3 ) { $g3="constant"; }
#2}}}
#{{{2  quto : q{yy}='yy'  qq{xx}="xx"   qx{}=`xxShellCmd`
$g1='20';
$g3=q{$g1};
$g3=qq{$g1};
$g3=qx{date +%Y%m}; #excute shell cmd

#2}}}
#{{{2  string/range =~ !=
$g1="xx1"; $g2="xx2"; $g3 = $g1 . $g2 ; #String add
$g1="xx1"; $g2=6; $g3 = $g1 x $g2 ; #String duplicate
$g3=(4..9);

if ("abc"=~/^\w+$/) { printf("L%u: match \n",__LINE__); }
if ("abc@"=~/^\w+$/) { printf("L%u: match \n",__LINE__); }
if ("abc@"!~/^\w+$/) { printf("L%u: not match \n",__LINE__); }
#2}}}

printf("L%u: (g1,g2,  g3)=($g1,$g2,  $g3)\n",__LINE__);
}
#1}}}
#{{{1 advance data structure

if (0) { #just used to remove some logs
printf("L%u:\n",__LINE__);
#{{{2    data{}[] = data{name}[idx]
my %hh1_class =  ();
my $hs1;
my $hr1;
#{{{3 add element 
$hh1_class{"person_01"} = [ 15, 20,"name1"];
$hh1_class{"person_02"} = [ 16, 21,"name2"];
for(my $hi1=0;$hi1<2;$hi1++) {
  my @ha1=[ $hi1+100, $hi1+200, "name_$hi1"];
  $hh1_class{"person_$hi1"} = \@ha1; #Local var can be save in hash/array, and will not delete outside of the visual scope
}
#3}}}
#{{{3 access element using reference
$hr1=\%hh1_class;
$hs1=$hh1_class{"person_02"}[2];
$hs1=($hr1)->{"person_02"}[2];
$hs1=($hr1)->{"person_02"}->[2];

$hs1=${$hr1}{"person_02"}[2]; #perlreftut : UseRule1: use {$ref} in place of arrayName or hashName
$hs1=$$hr1{"person_02"}[2]; # {$ref} here {} can be ignore
$hs1=$hr1->{"person_02"}[2]; #perlreftut : UseRule2: simple writing syntax using ->
$hs1=$hr1->{"person_02"}->[2]; #perlreftut :  continus {}->[] can simplify as {}[]
#3}}}
printf("L%u: hs1= $hs1 \n",__LINE__);
#printf("L%u: hr1= $hr1 \n",__LINE__);
#$hh1_class{"person_01"} = ( 15 );
print Dumper(\%hh1_class);


#2}}} 
#{{{2 data{}{}
my %hh2_regs;
my $hr2;
my $hs2;

$hh2_regs{"name_01"} = {"addr"=>0x0000,"defval"=>0x001,"curval"=>0x001};
$hh2_regs{"name_02"} = {"addr"=>1120,"defval"=>0x005,"curval"=>0x005};

$hr2 = \%hh2_regs;
$hr2->{"name_03"} = {"addr"=>3340,"defval"=>0x005,"curval"=>0x005};
$hs2 = ${$hr2}{"name_02"}{"addr"};
$hs2 = $$hr2{"name_02"}{"addr"};
$hs2 = $hr2->{"name_02"}{"addr"};
$hs2 = $hr2->{"name_02"}->{"addr"};
printf("L%u:\n",__LINE__);
printf("L%u: hs2 = $hs2 \n",__LINE__);
print Dumper(\%hh2_regs);
#2}}}
#{{{2 data{}{}[]  data{}{}{}: similar to C structre
my %hh3_trbs;
$hh3_trbs{"ab00"} = {
  "4B_array" => [0x001,0x002,0x004,0x005],
  "fields" => { "daddr"=>0x001, "dlen"=>0x002,"iso"=>1,"cn"=>1,"last"=>0 },
};
my $hr3a_trbs;
my $hr3b_4Bary;
my $hr3c_fields;
my $hs3;

$hr3a_trbs=\%hh3_trbs;
$hr3a_trbs->{"ab04"}{"4B_array"} = [0x11,0x22,0x33,0x44];

$hr3b_4Bary= $hr3a_trbs->{"ab04"}{"4B_array"};
$hr3a_trbs->{ab04}{fields}{daddr} = $hr3b_4Bary->[0];
$hr3a_trbs->{ab04}{fields}{dlen} = $hr3b_4Bary->[1];
$hr3a_trbs->{ab04}{fields}{iso} = ($hr3b_4Bary->[2]>>2)&0x1;

$hr3c_fields=$hr3a_trbs->{"ab04"}{"fields"};
$hr3c_fields->{cn}=($hr3b_4Bary->[3]>>2) & 0x1;
$hr3c_fields->{last}=($hr3b_4Bary->[3]>>0) & 0x1;

$hs3= $hr3a_trbs->{ab04}{fields}{daddr};
$hs3=hex("123")>>4; #Convert string to hex
printf("L%u: hs3=$hs3\n",__LINE__);

print Dumper(\%hh3_trbs);
#2}}}
}
#1}}}
#{{{1 binary/hex <---> string

if (0) { #just used to remove some logs
printf("L%u:\n",__LINE__);
my $is1="abcd";
my $is1="f";
my $is2=$is1;
$is2=hex($is1);
$is2=sprintf("%x",hex($is1));
$is2=sprintf("%016b",hex($is1));



printf("L%u: string,hex,decimal=%s,%x,%u \n",__LINE__,$is2,hex($is2),hex($is2));
}
#1}}}
#{{{1 regexp

if (0) { #just used to remove some logs
printf("L%u:\n",__LINE__);
my @ja1;
my $js1="123 abc456 789def ghi066jkl mno";
#{{{2 
@ja1 = ($js1 =~ m/(\w+)/); #just the first match
@ja1 = ($js1 =~ m/(\w+)/g); #get all matches
@ja1 = ($js1 =~ m/(\w+)\s+(\w+)/); #get $1 $2
#2}}}

#{{{2 Zero Length : lookbehind/lookahead is/isnot somthing
@ja1 = ($js1 =~ m/^(\w+)/);   # ^ = lookbehind no chars= [0] behind [1]
@ja1 = ($js1 =~ m/(\w+)$/);   # $ = lookahead no chars= [1] ahead [0]
@ja1 = ($js1 =~ m/(?<=\s)(\w+)/g); #lookbehind  (?<=MatchThisRegexp_zeroLenth)
@ja1 = ($js1 =~ m/(\w+)(?=\s)/g);  #lookahead (?=MatchThisRegexp_zeroLenth)


@ja1 = ($js1 =~ m/(?<!\s)(\w+)/g); #lookbehind  (?<Not.MatchThisRegexp_zeroLenth)
@ja1 = ($js1 =~ m/([a-zA-Z]+)(?!\d)/g);  #lookahead (?!Not.MatchThisRegexp_zeroLenth)

#2}}}
#{{{2 prvent backtracking : very useful with zero-lenth
@ja1 = ($js1 =~ m/(?>[a-zA-Z]+)(?!\d)/g);  #
@ja1 = ($js1 =~ m/(?>[a-zA-Z]+)(?=\d)/g);  #

#2}}}
#{{{2 : compare vim<==>perl  for lookbehind/lookahead + prevent-backtrace
#           behind<--s[0] s[1] s[2] s[3]-->ahead
#           regZ = regexp-ZeroLength match
#           regM = regexp-MaxLength match and not traceback
#           vim (regZ)\@.     <==>  perl (?.regZ)   : . is operation
#lookahead-match    :vim <==> perl :   reg0\(regZ\)\@=     <==>   reg0(?=regZ)
#lookahead-NotMatch :vim <==> perl :   reg0\(regZ\)\@!     <==>   reg0(?!regZ)
#
#lookbehind-match   :vim <==> perl :   \(regZ\)\@<=reg0    <==>   (?<=regZ)reg0
#lookbehind-NotMatch:vim <==> perl :   \(regZ\)\@<!reg0    <==>   (?<!regZ)reg0
#
#prevent-backtrace  :vim <==> perl :   \(regM\)\@>reg0     <==>   (?>regM)reg0
#2}}}


print Dumper(\@ja1);
printf("L%u: $1 $2 \n",__LINE__);
}
#1}}}

#{{{1 dir operation

#chdir("/etc");print `ls -l`;
sub fun_kf01_show_curdir_files() {
  my $tD1=shift;
  my $tH1;
  my $tF1;
  opendir $tH1,"$tD1";
  while($tF1 = readdir $tH1) {
    if ($tF1 =~ /^\.+$/) {  next;}
    print "$tD1/$tF1\n";
    if ( -d "$tD1/$tF1") {
      &fun_kf01_show_curdir_files("$tD1/$tF1");
    }
  }
}

#&fun_kf01_show_curdir_files("./zz01");
#&fun_kf01_show_curdir_files("/etc");


sub fun_kf02_tree_curdir_files() {
  my $tD1=shift;
  my $tS1=shift;
  my $tH1;
  my $tF1;
  $G1++;
  #if ($G1>500) {return;}
  printf("L%u: enter @ tD1=$tD1 @ tS1=$tS1\n",__LINE__) if($GD1);
  printf("$tS1=tS1 @ L%u: enter @ tD1=$tD1 @ \n",__LINE__) if($GD1); 
  opendir $tH1,"$tD1";
  my @tFA1=();
  while($tF1 = readdir $tH1) {
    if ($tF1 =~ /^\.+$/) {  next;}
    if ($tF1 =~ /^\./) {  next;}
    push @tFA1,$tF1;
  }

  my $tL1=@tFA1;
  #printf("L%u: $tD1 : $tL1\n",__LINE__);
  #print "@tFA1 \n";
  for(my $i=0;$i<$tL1;$i++) {
    $tF1=$tFA1[$i];
    my $nf="$tD1/$tF1";
    printf("L%u: $tD1\n",__LINE__) if($GD1);
    printf("L%u: $tS1\n",__LINE__) if($GD1);;
    print "$tS1---$tF1\n";
    printf("L%u:\n",__LINE__) if($GD1);
    if (-l "$nf") { next;}
    if (-d "$nf") {
      my $tS2;
      printf("L%u:i=$i, tL1=$tL1\n",__LINE__) if($GD1);;
      if ($i==($tL1-1)) {
        $tS2="$tS1";
        $tS2=~s/\|$/ /;
        $tS2="$tS2   |";
        printf("L%u:\n",__LINE__) if($GD1);;
      } 
      else {
        $tS2="$tS1   |";
      }
      &fun_kf02_tree_curdir_files("$nf","$tS2");
    }
  }

}

&fun_kf02_tree_curdir_files(".","|");
#&fun_kf02_tree_curdir_files("./zz01","|");
#&fun_kf02_tree_curdir_files("/etc","|");
#1}}}
printf("\n_______ end : L%u\n",__LINE__);
print `date +%N`;
printf("L%u:\n",__LINE__);
