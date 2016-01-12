class puppetconf::baseconf::agent ($master = undef, 
  $caserver = undef){
  
  ## section main config
  puppetconf::main {
    attribute => 'server',
    value     => $master,
  }

  puppetconf::main {
    attribute => 'ca_server',
    value     => $caserver,
  }

  ## section agent config
  puppetconf::agent {
    attribute => 'certname',
    value     => $trusted['certname']
  }
}