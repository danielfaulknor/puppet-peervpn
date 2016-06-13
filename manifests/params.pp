class peervpn::params {

    $config_template = 'peervpn/peervpn.conf.erb'
    $package_ensure  = 'present'
    $service_enable  = true
    $service_ensure  = 'running'
    $service_manage  = true 

    $config	     = '/etc/peervpn.conf'
    $package_name    = [ 'peervpn' ]
    $service_name    = 'peervpn'
    $network_name    = ''
    $psk             = ''
    $init_peers      = ''
    $init_peers_port = ''
    $ifconfig4       = ''
    $ifconfig6       = ''
    $relay           = 'no'

}  

