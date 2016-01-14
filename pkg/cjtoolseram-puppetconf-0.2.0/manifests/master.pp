#define types for section master
define puppetconf::master ($value,
  $attribute = $title) {
  ini_setting { "master - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => $attribute,
    value   => $value,
  }
}