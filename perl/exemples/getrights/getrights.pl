#!/usr/bin/perl -W
#
# small tool to backup files & directories permissions
# by fab <fab@gcu.info>
#
# HOWTO:
# - backup
# ./getrights.pl > owns
# (after the program is run, press ENTER)
# This store informations in the file "owns"
# - restore
# ./getrights.pl < owns
# This will restore informations contained in the file "owns"
#
use strict;
use File::Find;
my $DIR='/';
my $SEP=' = ';
my $KEY='BACK';
my $DEBUG=1;

my($dev,$ino,$mode,$nlink,$uid,$gid);
$_=<>;
chomp;
/$KEY/?&undo():&list();

sub nouveau {
if(not scalar(stat)) {
print STDERR "Error with $File::Find::name. (maybe not a real file)\n";
return;
}
($dev,$ino,$mode,$nlink,$uid,$gid)=stat;
printf "%o", ($mode&07000)>>9; # spe
printf "%o", ($mode&00700)>>6; # usr
printf "%o", ($mode&00070)>>3; # grp
printf "%o", ($mode&00007); # others
my $rmode=sprintf("%o",$mode&00777);
print ($SEP,$uid,$SEP,$gid,$SEP,$File::Find::name,"\n");
}

sub list {
print "$KEY\n";
my $File=find({wanted=>\&nouveau},$DIR);
}

sub undo {
my $cnt=0;
while(<>) {
chomp;
/^([0-9]{4})$SEP([0-9]+)$SEP([0-9]+)$SEP(.*)$/;
($mode,$uid,$gid,$dev)=($1,$2,$3,$4);
print "$1\n" if($dev=~/^\/(\w+)\/$/);
print ".";
$cnt++;
if($cnt>70) {
$cnt=0;
print "\n";
}
if(not $DEBUG) {
chown $uid,$dev;
chown $uid,$gid,$dev;
chmod oct($mode),$dev;
}
}
print "\n";
}
