#!/usr/bin/perl


use strict;
use Data::Dumper;
use vars qw(%hash2 %hash1 @arry1);
printf("hello world\n");
#
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
#1}}}

printf("\n_______ end : L%u\n",__LINE__);
printf("L%u:\n",__LINE__);
