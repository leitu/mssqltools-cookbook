#
# Cookbook Name:: mssqltools
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository 'msprod' do
  description "mssql tools"
  baseurl node["repostiory_url"]
  gpgkey  node["repostiory_key"] 
  action :create
end

ENV['ACCEPT_EULA']='Y'
package 'mssql-tools' do
  action :install
end
