class puppetconf::baseconf::mom ($caserver = $trusted['certname'],
	$archive_files = true,
	$peuser = 'pe-puppet',
	$pegroup = 'pe-puppet',
	$archive_file_server = $trusted['certname'],
	$module_groups = 'base+pe_only',
	$environmentpath = '/etc/puppetlabs/code/environments',
	$app_management = false,
	$node_terminus = 'classifier',
	$storeconfigs = true,
	$storeconfigs_backend = 'puppetdb',
	$always_cache_features = true,
	$reports = 'puppetdb',
	$graph = true){
  ## section main config
  puppetconf::main { 'certname':
    value     => $trusted['certname'],
  }
  puppetconf::main {'server':
    value     => $trusted['certname'],
  }

  puppetconf::main { 'user':
    value     => $peuser,
  }

  puppetconf::main {'group':
    value     => $pegroup,
  }

  if $archive_files {
    puppetconf::main {'archive_files':
      value     => 'true',
    }

    puppetconf::main {'archive_file_server':
      value     => $archive_file_server,
    }
  }

  puppetconf::main {'ca_server':
    value     => $caserver,
  }

  puppetconf::main {'module_groups':
    value     => $module_groups,
  }

  puppetconf::main {'environmentpath':
    value     => $environmentpath,
  }

  ## section master config
  puppetconf::master {'app_management':
    value     => $app_management,
  }  

  puppetconf::master {'node_terminus':
    value     => $node_terminus,
  }  
  
  if $storeconfigs {
    puppetconf::master {'storeconfigs':
      value     => $storeconfigs,
    }  

    puppetconf::master {'storeconfigs_backend':
      value     => $storeconfigs_backend,
    }
  }   

  puppetconf::master {'reports':
    value     => $reports,
  }

  puppetconf::master {'certname':
    value     => $trusted['certname'],
  }

  puppetconf::master {'always_cache_features':
    value     => $always_cache_features,
  }

  ## section agent config
  puppetconf::agent {'graph':
    value     => $graph,
  }
}