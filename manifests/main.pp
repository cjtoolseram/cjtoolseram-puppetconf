#define types for section main
define puppetconf::main ($value,
  $attribute = $title,
  $conf_path) {
  ini_setting { "main - ${attribute}":
    ensure  => present,
    path    => $conf_path,
    section => 'main',
    setting => $attribute,
    value   => $value,
  }
}
