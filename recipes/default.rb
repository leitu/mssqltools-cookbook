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
%w{ mssql-tools unixODBC-utf16-devel }.each do |pkg|
    package pkg do
          action :install
            end
end

link '/usr/bin/sqlcmd' do
    to '/opt/mssql-tools/bin/sqlcmd-13.0.1.0'
end

link '/usr/bin/bcp' do
    to '/opt/mssql-tools/bin/sqlcmd-13.0.1.0'
end
