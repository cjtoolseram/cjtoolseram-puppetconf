define puppetconf::agent ($attribute, $value) {
  ini_setting { "agent - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => $attribute,
    value   => $value,
  }
}