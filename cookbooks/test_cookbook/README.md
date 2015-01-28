# rs-base cookbook

[![Build Status](https://travis-ci.org/rightscale-cookbooks/rs-base.png?branch=master)](https://travis-ci.org/rightscale-cookbooks/rs-base)

Provides the basic recipes for setting up a RightScale instance.

Github Repository: [https://github.com/rightscale-cookbooks/rs-base](https://github.com/rightscale-cookbooks/rs-base)

# Requirements

* Requires Chef 11 or higher
* Platform
  * Ubuntu 12.04
  * CentOS 6.4

# Usage

Place the `rs-base::default` recipe in the runlist.

# Attributes

* `node['rs-base']['swap']['size']` - The swap file size in GB. This attribute must be an integer.
  Default is `1`.
* `node['rs-base']['swap']['file']` - The location of the swap file. This attribute must be a valid filename.
  Default is `'/mnt/ephemeral/swapfile'`.
* `node['rs-base']['ntp']['servers']` - List of fully qualified domain names for the array of servers that are used for
  updating time.
  Default is `['time.rightscale.com', 'ec2-us-east.time.rightscale.com', 'ec2-us-west.time.rightscale.com']`.
* `node['rs-base']['rsyslog_server']` - FQDN or IP address of a remote rsyslog server. Default is `nil`.

# Recipes

## `rs-base::default`

All-in-one recipe to run all recipes in rs-base cookbook.

## `rs-base::swap`

Creates a swapfile of the specified size (in GB) `node['rs-base']['swap']['size']` in the
specified location `node['rs-base']['swap']['file']` and enables it's usage.
The swap file is added to `/etc/fstab` and will persist across reboots. If the size or the
file location is invalid this recipe will fail with an error message indicating what the
failure was.

## `rs-base::ntp`

Configures ntp using servers in `node['rs-base']['ntp']['servers']`.

## `rs-base::rsyslog`

Installs and configures the rsyslog service. If `node['rs-base']['rsyslog_server']` is set, its value will be
used as the remote syslog server. Otherwise local machine is used.

## `rs-base::collectd`

Installs the collectd client with some of the basic plugins, syslog, interface, df, disk, memory, load,
processes, users, and network.

# Resources/Providers

## `rs-base_example_resource`

A resource to show as an example for this README doc.

### Actions

| Actions | Description | Default |
| --- | --- | --- |
| `:create` | create is an example for this README | yes |
| `:delete` | delete is an example for this README |  |

### Attributes

| Attribute | Description | Default Value | Required |
| --- | --- | --- | --- |
| `attribute_one` | Example attribute named attribute_one | `one` | yes |
| `next_attribute` | Example attribute named next_attribute |  | yes |
| `example_attribute` | Example attribute named example_attribute | | no |

# Helpers

This is a helper section for this README.  This is just an example of using this
section. To use them in a recipe add the following:

```ruby
class Chef::Recipe
  include RightScale::RightScaleTest
end
```

## `testing_helper_method`

Use this as an example for describing what your helper methods do.

```ruby
def testing_helper_method(node, application_name = nil, options = {})
```

### Parameters
| Name | Description | Type |
| --- | --- | --- |
| node | the Chef node | Chef::Node |
| application_name | the name of the application served by load balancer servers to search for; this is an optional parameter | String |
| options | optional parameters | Hash |


# Author

Author:: RightScale, Inc. (<cookbooks@rightscale.com>)
