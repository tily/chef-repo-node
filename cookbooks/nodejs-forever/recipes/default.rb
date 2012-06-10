#
# Cookbook Name:: node-forever
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nodejs"
include_recipe "npm"

npm_package "forever" do
  action :install
end
