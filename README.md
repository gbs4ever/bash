# My dotfiles
Enjoy this repo  :smile: :smiley: :smiley:

## Contents
The repo contains my bahs script to speed up dev work I work on a windows platofrm with WSL so many times my postgress server needs to be rebooted.

* `.aliases` contains bash aliases
* `load.sh` if you work on wsl system the linux subsystem will  disconnect the postgress server (somtimes) 

To use these download the repo into your root directory  (~/.bash_profile on mac)
For WSL users 

```cd ~ && git clone   git@github.com:gbs4ever/bash.git``` 

```nano ~/.bashrc```

Then copy this and add the bottom of you bashrc.

```bash 
for file in ~/bash/.*.sh
do source $file
done

