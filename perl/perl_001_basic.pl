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
if (1) { #just used to remove some logs
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




printf("\n_______ end : L%u\n",__LINE__);


#{{{1 array operations
#1}}}
#{{{1 hash operations
#1}}}

