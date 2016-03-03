#define types for section main
define puppetconf::main ($value,
  $conf_path,
  $attribute = $title) {
  ini_setting { "main - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'main',
    setting => $attribute,
    value   => $value,
  }
}
