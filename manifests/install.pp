class peervpn::install (
  $filestore,
  $package,
  $workspace,
  $peervpnsysconfig,
  $peervpninit,
) {
  if $filestore {
    if ! defined(File[$workspace]) {
      file { $workspace:
        ensure => directory,
      }
    }
  }
  file { "${workspace}/$package":
    ensure  => present,
    source  => "${filestore}/$package",
  }
  file { "${workspace}/$peervpnsysconfig":
    ensure  => present,
    source  => "${filestore}/$peervpnsysconfig",
    path   => "/etc/sysconfig/peervpn",
    owner => "root",
    group => "root",
    replace => false,
  }
  file { "${workspace}/$peervpninit":
    ensure  => present,
    source  => "${filestore}/$peervpninit",
    path   => "/etc/init.d/peervpn",
    owner => "root",
    group => "root",
    replace => false,
    mode    => 0755,
  }
  exec { 'unpack-peervpn-tarball':
    command     => "/bin/tar -zxf ${workspace}/${package}",
    cwd         => $workspace,
    creates     => "${workspace}/peervpn",
    require     => File["${workspace}/${package}"],
  }
  file { "/sbin/peervpn":
    ensure => present,
    owner => "root",
    group => "root",
    source => "puppet:///files/PEERVPN/peervpn",
    mode    => 0755,
    replace => false,
  }
  file { "/etc/peervpn":
    ensure => directory,
  }
  file { "${workspace}/peervpn.conf":
    ensure  => present,
    content => template('peervpn/peervpn.conf.erb'),
    require => File["/etc/peervpn"],
  }
}
