# ISO-AUTOMAT
scripts for the ISO-AUTOMAT

Feel free to help on making them better !

**Pull Requests Are Welcome :wink:**


## monitor.bash

simply creating a html webside for showing status of the server.

using `echo "${html_page[@]}"` to drop current states into a html files.

using variables on top of the script to fetch the info.

to update the page create a simple systemd timer.

<img src="https://raw.githubusercontent.com/killajoe/ISO-AUTOMAT/main/iso-automat-stat.png" width="450">


## github-repo-backup

script to backup all repositories from your GitHub (organisation or user) creating snapshots and sheduled removing oldes one.

`./github-repo-backup --help` for info about options.

you need to setup your github user locally for passwordless login :wink:
easiest way is to create a .netrc file with your token:

```
machine github.com
       login eosbuilder
       password your-github-secret-token
```

and set github local setup for your github name and email from terminal:


`git config --global user.name "Your-Name"`

git config --global user.email "youremail@yourdomain.com"`



