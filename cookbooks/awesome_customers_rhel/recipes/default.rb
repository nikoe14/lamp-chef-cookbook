#
# Cookbook Name:: awesome_customers_rhel
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'selinux::permissive'
include_recipe 'awesome_customers_rhel::firewall'
include_recipe 'awesome_customers_rhel::web_user'
include_recipe 'awesome_customers_rhel::web'
include_recipe 'awesome_customers_rhel::database'
