#!/bin/bash




set_local_bin_path() {
  logger "Creating a local bin path (~/.local/bin) folder and adding it to the $PATH"
  mkdir -p ~/.local/bin ~/.local/lib

  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  logger "exported local bin path variable to ~/.bashrc"
}





configure_locale() {
  logger "Configuring en_US.UTF-8 locale..."
  sudo locale-gen en_US.UTF-8

  # Add locale env variables to ~/.bashrc
  echo 'export LANG="en_US.UTF-8"' >> ~/.bashrc
  echo 'export LANGUAGE="en_US:en"' >> ~/.bashrc
  echo 'export LC_ALL="en_US.UTF-8"' >> ~/.bashrc
  logger "exported locale variables to ~/.bashrc"
}

# to do add time zone configure (set to UTC always)
# UTC it's a default time and should be by default on any server

# Modern XXI centry CLI text editor https://github.com/zyedidia/micro
# It should be on any linux server by default


main() {
  basic_install
  set_local_bin_path
  configure_locale
}
