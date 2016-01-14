#define types for section agent
define puppetconf::agent ($value,
  $attribute = $title) {
  ini_setting { "agent - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => $attribute,
    value   => $value,
  }
}