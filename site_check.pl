#!/usr/bin/perl

# Tool to automate checking website availability
# Written by: 666xyzw

use strict;
# use warnings;
# use diagnostics;



sub getDomains{
    
    # Reads the domains from a file called "domains" into @data list

    open my $RH, '<', "domains" || die "Can not open file!\n";
    my @data = <$RH>;
    close($RH);

    return @data;

}


sub domainTest{
    # Runs the curl system command to test the web page response

    my $d = $_[0];
    my $p = $_[1];

    my @curl_data = `curl -I --silent $p://$d`;

    return @curl_data;

}


sub responsParser{
    # parses the output from curl

    my @response = $_[0];
    my $used_protocol = $_[1];

    my ($http_status) = grep /HTTP\b.*$/, @response;
    
    printf "\tHTTP Status: %s \n", $http_status;
    
}


sub check{
    # runs the checks and parser subroutine on the output
    
    my @domain_list = @_;
    my $protocol;
    my @server_response;
    my $flag;

    foreach my $domain (@domain_list[3..$#domain_list]){

        $protocol = "https";

        @server_response = domainTest($domain, $protocol);
        
        ($flag) = grep /HTTP\b.*$/, @server_response;
        
        if ($flag eq ''){
            
            printf "DOMAIN: %s \n", $domain;
            printf "\tDomain does not accept HTTPS connection!\n";
            printf "\tTrying with HTTP connection!\n";

            $protocol = "http";

            @server_response = domainTest($domain, $protocol);
            responsParser(@server_response, $protocol);

        }else{

            printf "DOMAIN: %s \n", $domain;
            responsParser(@server_response, $protocol);

        }
    }

}

check(getDomains());