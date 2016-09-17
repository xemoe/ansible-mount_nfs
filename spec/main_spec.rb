require 'spec_helper'

describe "System spec" do
    describe "Required packages should be installed" do
        describe package('nfs-common') do
            it { should be_installed }
        end
    end
end

mounted_directory = '/mnt/nfs/172.100.0.202/nfs'

describe "Tasks spec" do
    describe "Given directory should be mounted directory" do
        describe file("#{mounted_directory}") do
              it { should be_mounted }
        end
    end
    describe file('/opt/system-config.d/fstab') do
        its(:content) { should match /172.100.0.202:srv\/nfs \/mnt\/nfs\/172.100.0.202\/nfs nfs4 proto=tcp,port=2049,_netdev 0 0/ }
    end
end
