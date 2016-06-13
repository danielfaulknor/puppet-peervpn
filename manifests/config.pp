class peervpn::config inherits peervpn {

    file { $config:
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template($config_template),
    }

}
