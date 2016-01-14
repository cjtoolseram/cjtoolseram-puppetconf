# puppetconf

#### Table of Contents

1. [Description](#description)
2. [Easy Setup](#easy-setup)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Variables](#variables)
6. [Limitations](#limitations)
7. [Development](#development)

## Description

This module is use to managed all your puppet.conf

NOTE: This module does not install agent!

## Easy Setup

For Master of Master Puppet.conf configuration
```
class { 'puppetconf::baseconf::mom':
}
```

For Compile Master Puppet.conf configuration
```
class { 'puppetconf::baseconf::cm':
  master   => 'mom.puppetdebug.vlan',
  caserver => 'mom.puppetdebug.vlan',
}
```

For Agents Puppet.conf configuration
```
class { 'puppetconf::baseconf::agent':
  master   => 'mom.puppetdebug.vlan',
  caserver => 'mom.puppetdebug.vlan',
}
```

## Usage

There are 3 define types which are meant for the sections in puppet.conf
* [main]
* [master]
* [agent]

section *[main]*
```
puppetconf::main { 'runinterval':
  value     => '1h',
}
```

section *[master]*
```
puppetconf::main { 'environment_timeout':
  value     => '0',
}
```

section *[agent]*
```
puppetconf::main { 'certname':
  value     => 'agent.puppetdebug.vlan',
}
```

There are also base classes with specific set of configuration. You can just include them in your classifier.

Master of Master:
```
class { 'puppetconf::baseconf::mom':
}
```

Compile Master:
```
class { 'puppetconf::baseconf::cm':
  master   => 'mom.puppetdebug.vlan',
  caserver => 'mom.puppetdebug.vlan',
}
```

Agent:
```
class { 'puppetconf::baseconf::agent':
  master   => 'mom.puppetdebug.vlan',
  caserver => 'mom.puppetdebug.vlan',
}
```

You can extend the classes by writing a wrapper module. E.g.

```
class wrapper {
  class { 'puppetconf::baseconf::agent':
    master   => 'mom.puppetdebug.vlan',
    caserver => 'mom.puppetdebug.vlan',
  }

  puppetconf::main { 'environment_timeout':
    value     => '180',
  }
}
```
This will add *environment_timeout = 180* to the main section of this config.

## Reference

Base output of puppet.conf from the predefined base classes.

Master of Master:
```
[main]
    certname = pe-201531-master.puppetdebug.vlan
    server = pe-201531-master.puppetdebug.vlan
    user  = pe-puppet
    group = pe-puppet
    archive_files = true
    archive_file_server = pe-201531-master.puppetdebug.vlan
    module_groups = base+pe_only
    environmentpath = /etc/puppetlabs/code/environments
    ca_server = pe-201531-master.puppetdebug.vlan

[agent]
    graph = true

[master]
app_management = true
node_terminus = classifier
storeconfigs = true
storeconfigs_backend = puppetdb
reports = puppetdb
certname = pe-201531-master.puppetdebug.vlan
always_cache_features = true
```

Compile Master:
```
[main]
server = mom.puppetdebug.vlan
module_groups = base+pe_only
environmentpath = /etc/puppetlabs/code/environments
user = pe-puppet
group = pe-puppet
ca_server = mom.puppetdebug.vlan
[agent]
certname = cm.puppetdebug.vlan

[master]
app_management = true
node_terminus = classifier
storeconfigs = true
storeconfigs_backend = puppetdb
reports = puppetdb
certname = cm.puppetdebug.vlan
always_cache_features = true
ca = false
```

Agent:
```
[main]
server = mom.puppetdebug.vlan
ca_server = mom.puppetdebug.vlan

[agent]
certname = agent.puppetdebug.vlan
```

## Variables
Below are the list of default value in each predefined class:

Class `puppetconf::baseconf::mom`:
`caserver`              = `$trusted['certname']`
`archive_files`         = `true`
`peuser`                = `pe-puppet`
`pegroup`               = `pe-puppet`
`archive_file_server`   = `$trusted['certname']`
`module_groups`         = `base+pe_only`
`environmentpath`       = `/etc/puppetlabs/code/environments`
`app_management`        = `false`
`node_terminus`         = `classifier`
`storeconfigs`          = `true`
`storeconfigs_backend`  = `puppetdb`
`always_cache_features` = `true`
`reports_to`            = `puppetdb`
`graph`                 = `true`

Class `puppetconf::baseconf::cm`:
`master`                = <font color="red">`undef`</font>
`caserver`              = <font color="red">`undef`</font>
`module_groups`         = `base+pe_only`
`peuser`                = `pe-puppet`
`pegroup`               = `pe-puppet`
`environmentpath`       = `/etc/puppetlabs/code/environments`
`ca_boolean`            = `false`
`app_management`        = `true`
`node_terminus`         = `classifier`
`storeconfigs`          = `true`
`storeconfigs_backend`  = `puppetdb`
`always_cache_features` = `true`
`reports_to`            = `puppetdb`

Class `puppetconf::baseconf::agent`:
`master`   = <font color="red">`undef`</font>
`caserver` = <font color="red">`undef`</font>

The above variables have the same name as Puppetlabs configuration attributes. The only exceptions are:
`peuser`     -> `user`
`pegroup`    -> `group`
`caserver`   -> `ca_server`
`ca_boolean` -> `ca`
`reports_to` -> `reports`

You may also visit the [Configuration Reference](https://docs.puppetlabs.com/references/latest/configuration.html) for further reference.

## Limitations

This module will only manage puppet.conf file but will not do any installation on the agent. Any configuration not under a section will not be modified or removed. This also applies to comments!

## Development

Feel free to hack around and pull request to add any improvement. Don't be shy!

