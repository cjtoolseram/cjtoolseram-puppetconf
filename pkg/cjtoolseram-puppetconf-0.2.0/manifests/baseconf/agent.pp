#class for agent section with predefined values
class puppetconf::baseconf::agent ($master = undef,
  $caserver = undef){
  ## section main config
  puppetconf::main { 'server':
    value     => $master,
  }

  puppetconf::main { 'ca_server':
    value     => $caserver,
  }

  ## section agent config
  puppetconf::agent { 'certname':
    value     => $::trusted['certname'],
  }
}