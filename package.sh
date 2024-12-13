find(){
  echo installing...
  sudo apt-get install fzf
  sudo apt-get install fd-find
}
postgres_install() {
  logger "Installing postgres..."
  sudo apt install -q -y postgresql postgresql-contrib libpq-dev
  logger "Successfully installed postgres client and server"

}
wsl_setup(){
  sudo apt-get update  
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev libpq-dev libgdbm-dev libncurses5-dev automake libtool bison gnupg postgresql postgresql-contrib
}
rvm(){
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  sudo apt-get install curl
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
}


node_nvm(){
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  source ~/.bashrc
  nvm install node
}

basic_install() {
  logger "Update system..."
  sudo apt-get update
  logger "Install basic utils..."
  sudo apt install -q -y git wget curl openssl tar zip unzip file tree htop ssh gnupg build-essential bash-completion net-tools dpkg software-properties-common
  # python-software-properties
}

set_local_bin_path() {
  logger "Creating a local bin path (~/.local/bin) folder and adding it to the $PATH"
  mkdir -p ~/.local/bin ~/.local/lib

  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  logger "exported local bin path variable to ~/.bashrc"
}