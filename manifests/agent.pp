#define types for section agent
define puppetconf::agent ($value,
  $attribute = $title,
  $conf_path) {
  ini_setting { "agent - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'agent',
    setting => $attribute,
    value   => $value,
  }
}
