class peervpn::config inherits peervpn {
 file { $config:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0644',
   content => template($config_template),
 }
}
