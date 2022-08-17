# site_check

## Overview
Perl script to check if a website is alive. The script first checks if the domain responds to HTTPS request
if not then it will try with HTTP. For connection testing it uses `curl` program.
The script was tested ONLY on *nix systems. On Windows you can use WSL or the Git Bash terminal.

## Usage
To run the script first put the domain names you want to test in the `domains` file; `domain1, domain2` and
`domain3` are provided only as an example, please remove them and provide the apropriate domains.
After writing the domains into the file, save it and open a terminal. In the terminal run it with `perl site_check`.

In case you want to make it a stand alone executable, make the script an executable file wit the below command:
`chmod 0700 site check`

and after this copy it into your `bin` folder.
