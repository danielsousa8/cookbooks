#
# Cookbook Name:: kibana
# Recipe:: default
#
# Copyright 2017, Ninjas
#
# All rights reserved - Do Not Redistribute
#

include_recipe "kibana::install"
include_recipe "kibana::settings"
include_recipe "kibana::start"
