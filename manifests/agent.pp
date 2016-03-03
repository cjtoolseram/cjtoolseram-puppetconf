#define types for section agent
define puppetconf::agent ($value,
  $conf_path,
  $attribute = $title) {
  ini_setting { "agent - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'agent',
    setting => $attribute,
    value   => $value,
  }
}
