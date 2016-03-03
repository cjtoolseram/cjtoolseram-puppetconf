#define types for section master
define puppetconf::master ($value,
  $attribute = $title,
  $conf_path) {
  ini_setting { "master - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'master',
    setting => $attribute,
    value   => $value,
  }
}
