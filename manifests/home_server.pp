# Configure a home_server for proxy config
define freeradius::home_server (
  Enum['udp', 'tcp'] $proto                              = 'udp',
  String $secret,
  Enum['none', 'status-server', 'request'] $status_check = 'none',
  Enum['auth', 'acct', 'auth+acct', 'coa'] $type         = 'auth',
  Optional[Integer] $check_interval                      = undef,
  Optional[Integer] $check_timeout                       = undef,
  Optional[String] $ipaddr                               = undef,
  Optional[String] $ipv6addr                             = undef,
  Optional[Integer] $max_outstanding                     = undef,
  Optional[Enum['no', 'yes']] $no_response_fail          = undef,
  Optional[Integer] $num_answers_to_alive                = undef,
  Optional[String] $password                             = undef,
  Optional[Integer] $port                                = 1812,
  Optional[Integer] $response_window                     = undef,
  Optional[Integer] $revive_interval                     = undef,
  Optional[String] $src_ipaddr                           = undef,
  Optional[String] $username                             = undef,
  Optional[String] $virtual_server                       = undef,
  Optional[Integer] $zombie_period                       = undef,
) {
  $fr_basepath = $::freeradius::params::fr_basepath

  # Configure config fragment for this home server
  concat::fragment { "homeserver-${name}":
    target  => "${fr_basepath}/proxy.conf",
    content => template('freeradius/home_server.erb'),
    order   => 10,
  }
}
