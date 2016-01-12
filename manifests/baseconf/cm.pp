class puppetconf::baseconf::cm ($master = undef, 
  $caserver = undef, 
  $module_groups = 'base+pe_only',
  $peuser = 'pe-puppet',
  $pegroup = 'pe-puppet',
  $environmentpath = '/etc/puppetlabs/code/environments',
  $ca_boolean = false,
  $app_management = true,
  $node_terminus = 'classifier',
  $storeconfigs = true,
  $storeconfigs_backend = 'puppetdb',
  $always_cache_features = true){
  ## section main config
  puppetconf::main {
    attribute => 'server',
    value     => $master,
  }

  puppetconf::main {
    attribute => 'ca_server',
    value     => $caserver,
  }

  puppetconf::main {
    attribute => 'module_groups',
    value     => $module_groups,
  }

  puppetconf::main {
    attribute => 'environmentpath',
    value     => $environmentpath,
  }

  puppetconf::main {
    attribute => 'user',
    value     => $peuser,
  }

  puppetconf::main {
    attribute => 'group',
    value     => $pegroup,
  }

  ## section master config
  puppetconf::master {
    attribute => 'ca',
    value     => $ca_boolean,
  }

  puppetconf::master {
    attribute => 'app_management',
    value     => $app_management,
  }  

  puppetconf::master {
    attribute => 'node_terminus',
    value     => $node_terminus,
  }  

  if $storeconfigs {
    puppetconf::master {
      attribute => 'storeconfigs',
      value     => $storeconfigs,
    }  

    puppetconf::master {
      attribute => 'storeconfigs_backend',
      value     => $storeconfigs_backend,
    }
  }    

  puppetconf::master {
    attribute => 'reports',
    value     => $reports,
  }

  puppetconf::master {
    attribute => 'certname',
    value     => $::certname,
  }

  puppetconf::master {
    attribute => 'always_cache_features',
    value     => $always_cache_features,
  }

  ## section agent config
  puppetconf::agent {
    attribute => 'certname',
    value     => $::certname,
  }
}