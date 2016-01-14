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
<table border = "0">
<tr><td>caserver</td><td> = </td><td>$trusted['certname']</td></tr>
<tr><td>archive_files</td><td> = </td><td>true</td></tr>
<tr><td>peuser</td><td> = </td><td>pe-puppet</td></tr>
<tr><td>pegroup</td><td> = </td><td>pe-puppet</td></tr>
<tr><td>archive_file_server</td><td> = </td><td>$trusted['certname']</td></tr>
<tr><td>module_groups</td><td> = </td><td>base+pe_only</td></tr>
<tr><td>environmentpath</td><td> = </td><td>/etc/puppetlabs/code/environments</td></tr>
<tr><td>app_management</td><td> = </td><td>false</td></tr>
<tr><td>node_terminus</td><td> = </td><td>classifier</td></tr>
<tr><td>storeconfigs</td><td> = </td><td>true</td></tr>
<tr><td>storeconfigs_backend</td><td> = </td><td>puppetdb</td></tr>
<tr><td>always_cache_features</td><td> = </td><td>true</td></tr>
<tr><td>reports_to</td><td> = </td><td>puppetdb</td></tr>
<tr><td>graph</td><td> = </td><td>true</td></tr>
</table>
<br/>

Class `puppetconf::baseconf::cm`:
<table border = "0">
<tr><td>master</td><td> = </td><td>undef</td></tr>
<tr><td>caserver</td><td> = </td><td>undef</td></tr>
<tr><td>module_groups</td><td> = </td><td>base+pe_only</td></tr>
<tr><td>peuser</td><td> = </td><td>pe-puppet</td></tr>
<tr><td>pegroup</td><td> = </td><td>pe-puppet</td></tr>
<tr><td>environmentpath</td><td> = </td><td>/etc/puppetlabs/code/environments</td></tr>
<tr><td>ca_boolean</td><td> = </td><td>false</td></tr>
<tr><td>app_management</td><td> = </td><td>true</td></tr>
<tr><td>node_terminus</td><td> = </td><td>classifier</td></tr>
<tr><td>storeconfigs</td><td> = </td><td>true</td></tr>
<tr><td>storeconfigs_backend</td><td> = </td><td>puppetdb</td></tr>
<tr><td>always_cache_features</td><td> = </td><td>true</td></tr>
<tr><td>reports_to</td><td> = </td><td>puppetdb</td></tr>
</table>
<br/>


Class `puppetconf::baseconf::agent`:
<table border = "0">
<tr><td>master</td><td> = </td><td>undef</td></tr>
<tr><td>caserver</td><td> = </td><td>undef</td></tr>
</table>
<br/>

The above variables have the same name as Puppetlabs configuration attributes. The only exceptions are:
<table border = "0">
<tr><td>peuser</td><td> -> </td><td>user</td></tr>
<tr><td>pegroup</td><td> -> </td><td>group</td></tr>
<tr><td>caserver</td><td> -> </td><td>ca_server</td></tr>
<tr><td>ca_boolean</td><td> -> </td><td>ca</td></tr>
<tr><td>reports_to</td><td> -> </td><td>reports</td></tr>
</table>
<br/>

You may also visit the [Configuration Reference](https://docs.puppetlabs.com/references/latest/configuration.html) for further reference.

## Limitations

This module will only manage puppet.conf file but will not do any installation on the agent. Any configuration not under a section will not be modified or removed. This also applies to comments!

## Development

Feel free to hack around and pull request to add any improvement. Don't be shy!

