define puppetconf::main ($attribute, $value) {
  ini_setting { "main - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => $attribute,
    value   => $value,
  }
}