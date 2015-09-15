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

git 'C:\inetpub\wwwroot' do
  repository "git://github.com/geethaka/webtest.git"
  destination 'C:\inetpub\wwwroot'
  reference "master"
  action :sync
end

