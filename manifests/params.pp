class peervpn::params {
 $config_template = 'peervpn/peervpn.conf.erb'
 $package_ensure  = 'present'
 $service_enable  = true
 $service_ensure = 'running'
 $service_manage = true 

 case $::osfamily {
     'redhat': {
      $config	= '/etc/peervpn/peervpn.conf'
      $package_name =   [ 'peervpn' ]
      $service_name =   'peervpn'
      $network_name =   ''
      $init_peers  = ''
      $init_peers_port = ''
      $ipaddr_Netmask  = ''
      $ifconfig4       = ''
  }
  default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
 }
}  

