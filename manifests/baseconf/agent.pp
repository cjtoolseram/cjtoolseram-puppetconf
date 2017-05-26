#class for agent section with predefined values
class puppetconf::baseconf::agent ($master = undef,
  $conf_path = '/etc/puppetlabs/puppet/puppet.conf',
  $caserver = undef,
  $runinterval = '30m',
  ){

  #the define types defaults
  Puppetconf::Main {
    conf_path => $conf_path,
  }

  Puppetconf::Agent {
    conf_path => $conf_path,
  }

  ## section main config
  puppetconf::main { 'server':
    value     => $master,
  }

  puppetconf::main { 'ca_server':
    value     => $caserver,
  }
  
  puppetconf::main { 'runinterval':
    value     => $runinterval,
  }

  ## section agent config
  puppetconf::agent { 'certname':
    value     => $::trusted['certname'],
  }
}
