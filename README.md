# My dotfiles
Enjoy this repo  :smile: :smiley: :smiley:

## Contents
The repo contains my bash script's to speed up my dev work. I work on a windows platform with WSL (linux subsystem) many times my postgres server needs to be rebooted.
as the  subsystem will  disconnect the postgressql server  use `load`  command to restart the psql server . 

* `.aliases` contains bash aliases
* `.heroku.sh`   contains heroku  aliases
* `updates.sh`  functions to update diffrent gems/packages etc 
* `packages.sh`  functions to get linx based packages  etc 

To use these just  download the repo into your root directory  (~/.bash_profile on mac)

```cd ~ && git clone   git@github.com:gbs4ever/bash.git``` 
When you install Oh My Bash, it creates a new .bashrc file in your home directory, potentially overwriting the existing one. This means any custom configurations or environment variables you previously added might be lost , you we need to re add this type into teminal .

```nano ~/.bashrc```

Then copy this and add this close to the bottom of you bashrc.

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
