# My dotfiles
Enjoy this repo  :smile: :smiley: :smiley:

## Contents
The repo contains my bash script's to speed up my dev work. I work on a windows platform with WSL so many times my postgres server needs to be rebooted.
if you work on wsl system the linux subsystem will  disconnect the postgressql server (sometimes) use `load`  command to restart the psql server . 

* `.aliases` contains bash aliases
* `.heroku.sh`   contains heroku  aliases
* `updates.sh`  functions to update diffrent gems/packages etc 
* `packages.sh`  functions to get linx based packages  etc 

To use these just  download the repo into your root directory  (~/.bash_profile on mac)
For WSL users 

```cd ~ && git clone   git@github.com:gbs4ever/bash.git``` 

```nano ~/.bashrc```

Then copy this and add it to the bottom of you bashrc.

```bash 
for file in ~/bash/.*.sh
do source $file
done
```
If you want to keep this repo updated locally dont forget 
```git pull``` or just use the keywords ```update_bash```in bash or if you want to keep current shell open ```update_current``` .

<br>
<br>
 <h2>Simcha Greenbaum</h2>
 <br>
				<span>
					© All rights are reserved  2021 Made with
					<span aria-label="love" role="img">
						💖
					</span>
