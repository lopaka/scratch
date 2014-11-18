#
# Cookbook Name:: test_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# Tag hello:test=blah
if system('rpm -qa | grep rightscale-5 > /dev/null')
  right_link_tag 'hello:test=rightlinktag'
else
  chef_gem 'machine_tag'
  machine_tag 'hello:test=machinetag'
end
