begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant local rsync.deb plugin must be run within Vagrant."
end

module VagrantPlugins
  module LocalRsyncDeb
    class Plugin < Vagrant.plugin("2")

      name "LocalRsyncDeb"

      description <<-DESC
      Overrides the Debian rsync_install capability to use an rsync.deb file in
      the vagrant project directory rather than using apt-get.
      DESC

      guest_capability "debian", "rsync_install" do
        require_relative "rsync_install"
        RsyncInstall
      end

    end
  end
end
