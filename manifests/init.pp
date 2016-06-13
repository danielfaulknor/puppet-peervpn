# == Class: peervpn

class peervpn (
 $filestore = 'puppet:///files/PEERVPN',
 $config_template   = $peervpn::params::config_template,
 $package_ensure    = $peervpn::params::package_ensure,
 $package_name      = $peervpn::params::package_name,
 $servers	    = $peervpn::params::servers,
 $service_enable    = $peervpn::params::service_enable,
 $service_ensure    = $peervpn::params::service_ensure,
 $service_manage    = $peervpn::params::service_manage,
 $service_name      = $peervpn::params::service_name,
 $network_name      = $peervpn::params::network_name,
 $psk               = $peervpn::params::psk,
 $init_peers        = $peervpn::params::init_peers,
 $init_peers_port   = $peervpn::params::init_peers_port,
 $ifconfig4         = $peervpn::params::ifconfig4,
 $ifconfig6         = $peervpn::params::ifconfig6,
 $relay             = $peervpn::params::relay,


) inherits peervpn::params {

  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  class { '::peervpn::install': } ->
  class { '::peervpn::config': } ->
  class { '::peervpn::service': }
}

