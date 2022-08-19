# site_check

## Overview
Perl script to check if a website is alive. The script first checks if the domain responds to HTTPS request
if not then it will try with HTTP. For connection testing it uses the `LWP::UserAgent` library. If you do not have
the library on your system then, you have to install it!
The script was tested ONLY on *nix systems. On Windows you can use WSL or the Git Bash terminal.

## Library Installation
To install the LWP library start the `cpan` console (this is `perl's` own shell if you like) in a terminal; in
case this is your first time running `cpan` go through the configuration wizzard, otherwise you can not use it.
After you have configured cpan run the following command: `install LWP` and let `cpan` handle the rest. If in the end
`perl` says that the `LWP` library has some dependencies, like the `HTTP` library, then install it/them like you tried
to install the `LWP` library and after you have the dependencies on your system, re-run the `install LWP` command

## Usage
### Single Domain
To run the script for a single domain, just run the script specifying the domain name as an argument variable,like:

`perl site_check domain_name`.

### Multi Domain
To run the script for multiple domains, first put the domain names you want to test in the `domains` file; `domain1, domain2` and
`domain3` are provided only as an example, please remove them and provide the apropriate domains.
After writing the domains into the file, save it and open a terminal. In the terminal run it with
`perl site_check`.

In case you want to make it a stand alone executable, make the script an executable file with
`chmod 0700 site_check` and after this copy it into your `bin` folder.
