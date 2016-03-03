#define types for section master
define puppetconf::master ($value,
  $conf_path,
  $attribute = $title) {
  ini_setting { "master - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'master',
    setting => $attribute,
    value   => $value,
  }
}
