#define types for section main
define puppetconf::main ($value,
  $attribute = $title) {
  ini_setting { "main - ${attribute}":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => $attribute,
    value   => $value,
  }
}