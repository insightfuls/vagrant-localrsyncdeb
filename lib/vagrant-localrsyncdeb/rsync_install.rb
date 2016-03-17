module VagrantPlugins
  module LocalRsyncDeb

    class RsyncInstall
      def self.rsync_install(machine)
        comms = machine.communicate
        raise NotReady.new() unless comms.wait_for_ready(60)
        raise NoFile.new() unless File.file?('rsync.deb')
        begin
          comms.upload("rsync.deb","/tmp/rsync.deb")
        rescue
          raise NoUpload.new()
        end
        raise NoInstall.new() unless comms.sudo("dpkg -i /tmp/rsync.deb") == 0
      end
    end

    class NotReady < Vagrant::Errors::VagrantError
      error_message("VM not ready for communication")
    end

    class NoFile < Vagrant::Errors::VagrantError
      error_message("No local rsync.deb")
    end

    class NoUpload < Vagrant::Errors::VagrantError
      error_message("Error uploading rsync.deb")
    end

    class NoInstall < Vagrant::Errors::VagrantError
      error_message("Error installing rsync")
    end

  end
end
