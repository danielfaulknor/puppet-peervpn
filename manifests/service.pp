class peervpn::service inherits peervpn {
 if ! ($service_ensure in [ 'running', 'stopped' ]) {
   fail('service_ensure parameter must be running or stopped')
   exec { 'remove-peervpn-lock':
    command     => "/bin/rm /var/lock/subsys/peervpn",
   }
 }
 if $service_manage == true {
   service { 'peervpn':
     ensure	=> $service_ensure,
     enable     => $service_enable,
     name       => $service_name,
     hasstatus  => true,
     hasrestart => true,
   }
 }
}
