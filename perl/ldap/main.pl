#!/usr/bin/perl -w
# recupere les users qui ont une adresse smtp

use Net::LDAP;

$dc1="infonecs.infoel.pf";
$dc2="tse1.infoel.pf";

$searchbase="dc=infoel,dc=pf";

$user="cn=Administrateur,cn=users,dc=infoel,dc=pf";
$passwd="le mot de passe vient ici";

$noldapserver=0;
$ldap = Net::LDAP->new($dc1) or $noldapserver=1;
if ($noldapserver == 1)  {
   print "releve vers $dc2 ...\n";
   $ldap = Net::LDAP->new($dc2) or
      die "Erreur de connexion au controlleurs de domaine $@ \n";
}
print "Connecte !\n";
$requete = $ldap->bind ( dn => $user, password =>$passwd);

if ( $requete->code()) {
    die ("erreur:", $requete->code(),"\n");
    }

$searchbase = $searchbase;

$requete = $ldap->search (base   => $searchbase,
                       filter => "(&(sAMAccountName=*)(mail=*))",
                       attrs  => "proxyAddresses");

$entries = $requete->count;

foreach my $entry ( $requete->entries ) {
   foreach my $mail ( $entry->get_value( "proxyAddresses" ) ) {
     if ( $mail =~ s/^(smtp|SMTP)://gs ) {
       print $mail." OK\n";
     }
   }
}
$ldap->unbind;
