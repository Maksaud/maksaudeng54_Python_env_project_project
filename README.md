# Python Environment Project

## Content
- The app
- Cookbook
  - Provisions
  - Unit Tests
  - Integration test
- AMI

- Using Github pull request build plugin
## The app

The app creates a itjobswatch.csv file and allows you to edit it

For the app to run and pass tests there were some packages to be installed.

Luckily these where set up in a requirement.txt

so first we would have to install python3, pip3 and pycharm.

```
brew install python3

```

To install everything from the requirements.txt file and their specified versions:

```
pip3 install -r requirements.txt
```

The txt file will contain:

```
atomicwrites==1.3.0
attrs==19.1.0
beautifulsoup4==4.8.0
certifi==2019.6.16
chardet==3.0.4
idna==2.8
importlib-metadata==0.19
more-itertools==7.2.0
packaging==19.1
pluggy==0.12.0
py==1.8.0
pyparsing==2.4.2
pytest==5.1.0
requests==2.22.0
six==1.12.0
soupsieve==1.9.2
urllib3==1.25.3
wcwidth==0.1.7
zipp==0.5.2
```

To run app

```
python3 main.py
```

To run tests

```
python3 -m pytest tests
```

# Cookbook

This cookbook was used to provision a virtual machine with the working app and passes tests and to provision jenkins

## Provisions

update source code

```
apt_update 'update_sources' do
  action :update
end
```

Install requirements for the app

First install python3

```
package 'python3-pip'
```
Insert your app into your virtual machine

chef will look for the app from the directory 'files/default/'

Give it root permissions to user and group so it can edit and create other files

```
remote_directory '/home/ubuntu/app' do
  user 'root'
  group 'root'
  source 'It_Jobs_Watch_Data_Package'
  action :create
end
```

Install all packages in the file requirement.txt

```
bash 'installing_from_requirements.txt' do
  user 'root'
  group 'root'
  code <<-EOH
  sudo pip3 install -r /home/ubuntu/app/requirements.txt
  EOH
end
```

Create a directory called downloads so that the app can store data in that file and give it permissions for reading and writing.

```
directory '/home/ubuntu/Downloads' do
  owner 'root'
  user 'root'
  group 'root'
  action :create
  mode '0777'
end
```

Installing jenkins using bash commands

First JRE and JDK need to be installed as jenkins runs on JAVA

Then add jenkins key
then install jenkins

```
bash 'installing_jre' do
  code <<-EOH
    sudo apt-get -y install default-jre
    sudo apt-get -y install default-jdk
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update -y
    sudo apt-get install jenkins -y
    EOH
end
```

## Unit Tests

```
it 'should update the source code' do
  expect(chef_run).to update_apt_update 'update_sources'
end

it 'Includes pip package' do
  expect(chef_run).to install_package 'python3-pip'
end

it 'should create a Downloads folder' do
  expect(chef_run).to create_directory '/home/vagrant/Downloads'
end

it 'should create a Downloads folder' do
  expect(chef_run).to create_directory '/home/ubuntu/Downloads'
end

it 'should create a remote Downloads folder' do
  expect(chef_run).to create_remote_directory '/home/ubuntu/app'
end

it 'converges successfully' do
  expect { chef_run }.to_not raise_error
end
```

## Integration test

These are the integration tests

I test if pip3 package is installed

Since bash commands were used to install all packages on the requirements.txt file I could not use chef to test, I had to check if my machine contained the files and directories required

```
describe package('python3-pip') do
  it { should be_installed }
end

describe directory('/usr/local/lib/python3.6/dist-packages/atomicwrites') do
  it { should exist }
end

```

# AMIs
I used packer to provision the jenkins

I created a packer.json file that selects a certain subnet and uses my aws credentials.

My slave node is created with this too

The provisioners on packer.json

```json
{
  "provisioners": [
    {
      "type": "chef-solo",
      "cookbook_paths": ["./cookbooks"],
      "run_list":["it_jobs::default"]
    },
    {
      "type":"shell",
      "inline":["cd /home/ubuntu/app", "sudo python3 -m pytest tests"]
    }]
}
```
Edit
edit
