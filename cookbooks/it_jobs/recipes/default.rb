#
# Cookbook:: it_jobs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'python3-pip'

remote_directory '/home/ubuntu/app' do
  user 'root'
  group 'root'
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

bash 'installing_jre' do
  code <<-EOH
    sudo apt-get -y install default-jre
  EOH
end
bash 'install_jdk' do
  code <<-EOH
    sudo apt-get -y install default-jdk
  EOH
end

bash 'getting key from jenkins' do
  code <<-EOH
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  EOH
end


bash 'getting jenkins recources' do
  code <<-EOH
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  EOH
end

bash 'updating source code' do
  code <<-EOH
    sudo apt-get update -y
  EOH
end

bash 'installing jenkins' do
    code <<-EOH
      sudo apt-get install jenkins -y
    EOH
end
