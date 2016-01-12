class puppetconf::baseconf::mom ($caserver = $::certname,
	$archive_files = true,
	$peuser = 'pe-puppet',
	$pegroup = 'pe-puppet',
	$archive_file_server = $::certname,
	$module_groups = 'base+pe_only',
	$environmentpath = '/etc/puppetlabs/code/environments',
	$app_management = true,
	$node_terminus = 'classifier',
	$storeconfigs = true,
	$storeconfigs_backend = 'puppetdb',
	$always_cache_features = true,
	$reports = 'puppetdb',
	$grapth = true){
  ## section main config
  puppetconf::main {
    attribute => 'certname',
    value     => $::certname,
  }
  puppetconf::main {
    attribute => 'server',
    value     => $::certname,
  }

  puppetconf::main {
    attribute => 'user',
    value     => $peuser,
  }

  puppetconf::main {
    attribute => 'group',
    value     => $pegroup,
  }

  if $archive_files {
    puppetconf::main {
      attribute => 'archive_files',
      value     => 'true',
    }

    puppetconf::main {
      attribute => 'archive_file_server',
      value     => $archive_file_server,
    }
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

  ## section master config
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
    attribute => 'graph',
    value     => $grapth,
  }
}