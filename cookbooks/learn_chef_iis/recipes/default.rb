#
# Cookbook Name:: learn_chef_iis
# Recipe:: default
#
# Copyright (C) 2014
#
#
#
#
include_recipe 'git::windows'

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).InstallState -eq 'Installed'"
end

service 'w3svc' do
  action [:enable, :start]
end

template 'c:\inetpub\wwwroot\Default.htm' do
  source 'index.html.erb'
end

directory 'C:\MyDirectory' do
  action :create
  recursive true
  rights :full_control, "Administrator", :applies_to_children => true
end

git_client 'default' do
  action :install
end

git 'C:\MyDirectory' do
  repository "git://github.com/opscode/chef.git"
  reference "master"
  action :sync
end
