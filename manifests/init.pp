# == Class: peervpn
#
# Class to install peervpn
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { peervpn:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <mdecamps@gmail.com>
#
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

