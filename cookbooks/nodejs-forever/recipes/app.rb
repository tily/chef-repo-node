#
# Cookbook Name:: node-forever
# Recipe:: app
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nodejs-forever"

git "/usr/local/#{node[:nodejs_forever][:app_name]}" do                            
  repository node[:nodejs_forever][:git_url]
  #revision branch_name
  action :sync                                     
end

bash "npm install in #{node[:nodejs_forever][:script_dir]}" do
  user "root"
  cwd node[:nodejs_forever][:script_dir]
  code "/usr/local/bin/npm install"
end

nodejs_forever_app node[:nodejs_forever][:app_name] do
  script_dir node[:nodejs_forever][:script_dir]
  script_file node[:nodejs_forever][:script_file]
  user "root"
  action :install
end

nodejs_forever_app node[:nodejs_forever][:app_name] do
  action :start
end
