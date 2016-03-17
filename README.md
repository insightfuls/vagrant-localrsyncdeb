# Vagrant-LocalRsyncDeb

Overrides the Debian rsync install capability to use an rsync.deb file in the vagrant project directory rather than using apt-get.

This means you can proceed to the provisioning stage on a vanilla Debian box without Internet access.

## Installation

    $ vagrant plugin install vagrant-localrsyncdeb

## Usage

Obtain an rsync .deb file. You can do this by:

    $ apt-get install rsync
    $ ls /var/cache/apt/archives/rsync*.deb

Take a copy of the file you want, and place it in your vagrant project directory (alongside Vagrantfile). Name it rsync.deb (or symlink rsync.deb to the real file).

Voilà!

