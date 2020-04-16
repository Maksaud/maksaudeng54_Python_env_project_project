#
# Cookbook:: it_jobs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'python3-pip'

remote_directory '/home/ubuntu/requirements' do
  user 'root'
  group 'root'
  source 'all_requirementss'
  action :create
end

bash 'installing_from_requirements.txt' do
  user 'root'
  group 'root'
  code <<-EOH
  sudo pip3 install -r /home/ubuntu/requirements/requirements.txt
  EOH
end

# For Chef Tests
directory '/home/vagrant/Downloads' do
  owner 'root'
  user 'root'
  group 'root'
  action :create
  mode '0777'
end

# For Packer
directory '/home/ubuntu/Downloads' do
  owner 'root'
  user 'root'
  group 'root'
  action :create
  mode '0777'
end
