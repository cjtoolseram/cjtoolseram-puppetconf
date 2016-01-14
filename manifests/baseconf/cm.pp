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
  puppetconf::main { 'server':
    value     => $master,
  }

  puppetconf::main { 'ca_server':
    value     => $caserver,
  }

  puppetconf::main { 'module_groups':
    value     => $module_groups,
  }

  puppetconf::main { 'environmentpath':
    value     => $environmentpath,
  }

  puppetconf::main { 'user':
    value     => $peuser,
  }

  puppetconf::main { 'group':
    value     => $pegroup,
  }

  ## section master config
  puppetconf::master {'ca':
    value     => $ca_boolean,
  }

  puppetconf::master { 'app_management':
    value     => $app_management,
  }  

  puppetconf::master { 'node_terminus':
    value     => $node_terminus,
  }  

  if $storeconfigs {
    puppetconf::master { 'storeconfigs':
      value     => $storeconfigs,
    }  

    puppetconf::master { 'storeconfigs_backend':
      value     => $storeconfigs_backend,
    }
  }    

  puppetconf::master { 'reports':
    value     => $reports,
  }

  puppetconf::master { 'certname':
    value     => $trusted['certname'],
  }

  puppetconf::master { 'always_cache_features':
    value     => $always_cache_features,
  }

  ## section agent config
  puppetconf::agent { 'certname':
    value     => $trusted['certname'],
  }
}