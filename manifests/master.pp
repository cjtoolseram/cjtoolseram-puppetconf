define puppetconf::master ($attribute, $value) {
  ini_setting { "master - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => $attribute,
    value   => $value,
  }
}