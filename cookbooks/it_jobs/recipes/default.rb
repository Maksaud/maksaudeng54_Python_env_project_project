#
# Cookbook:: it_jobs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'python3-pip'
#


remote_directory '/home/ubuntu/app' do
  source 'It_Jobs_Watch_Data_Package'
  action :create
end

bash 'installing_from_requirements.txt' do
  user 'root'
  group 'root'
  code <<-EOH
  sudo pip3 install -r /home/ubuntu/app/requirements.txt
  EOH
end
#
#
directory '/home/vagrant/Downloads' do
  owner 'root'
  group 'root'
  action :create
  mode '0777'
end
