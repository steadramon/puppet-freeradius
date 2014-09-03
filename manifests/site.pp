# Install FreeRADIUS virtual servers (sites)
define freeradius::site (
  $source  = undef,
  $content = undef,
) {
  $fr_package = $::freeradius::params::fr_package
  $fr_service = $::freeradius::params::fr_service
  $fr_basepath = $::freeradius::params::fr_basepath
  $fr_user = $::freeradius::params::fr_user

  file { "${fr_basepath}/sites-enabled/${name}":
    mode    => '0640',
    owner   => 'root',
    group   => 'radiusd',
    source  => $source,
    content => $content,
    require => Package[$fr_package],
    notify  => Service[$fr_service],
  }
}
