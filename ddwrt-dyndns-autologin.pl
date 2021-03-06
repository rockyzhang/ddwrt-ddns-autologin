#!/usr/bin/perl

use WWW::Mechanize;


my $mech = WWW::Mechanize->new();
my $url  = "https://account.dyn.com";

my $USERNAME = `nvram get ddns_username_buf`;
my $PASSWORD = `nvram get ddns_passwd_buf`;

#Trim the strings
$USERNAME  =~ s/^\s+|\s+$//g;
$PASSWORD  =~ s/^\s+|\s+$//g;

$mech->add_header( "User-agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) \
                                  AppleWebKit/537.36 (KHTML, like Gecko) \
                                  Chrome/27.0.1453.110 Safari/537.36" );
$mech->get($url);



$result = $mech->submit_form(
    form_number => 2,
    fields      => {
        username => $USERNAME,
        password => $PASSWORD,
    }
);

