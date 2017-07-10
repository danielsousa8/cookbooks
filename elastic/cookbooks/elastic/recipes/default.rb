#
# Cookbook Name:: elasticsearch
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "elastic::install"
include_recipe "elastic::settings"
include_recipe "elastic::start"
