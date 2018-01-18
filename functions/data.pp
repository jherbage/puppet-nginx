function nginx::data() {
  $base_params = {
    'nginx::ensure'        => 'present',
    'nginx::package_name'  => 'nginx',
    'nginx::config_dir'    => '/etc/nginx',
    'nginx::config_ensure' => 'file',
    'nginx::config_mode'   => '0664',
    'nginx::config_owner'  => 'root',
    'nginx::config_group'  => 'root',
    'nginx::config_confd'  => "${config_dir}/conf.d",
    'nginx::config_log_dir' => '/var/log/nginx',
    'nginx::config_pid_file' => 'run/nginx.pid',

    'nginx::service_name' => 'nginx',
    'nginx::service_ensure' => 'running',
    'nginx::service_pattern' => 'nginx',
    'nginx::service_enable' => true,
    'nginx::service_hasstatus' => true,
    'nginx::service_hasrestart' => true,
   
    'nginx::docroot' => '/usr/share/nginx',
}

    $config_vdir_enable = $facts['os']['family'] ? {
      'Debian' => $config_dir,
      default  => undef,
    }
 
    $config_process_user = $facts['os']['family'] ? {
      'Debian' => 'www-data',
      default  => 'nginx',
    }

    $vhost_dir = $facts['os']['family'] ? {
      'Debian' => "${config_dir}/sites-enabled",
      default  => $base_params['nx::config_confd']
    }

    $extra_params = {
      'nginx::config_vdir_enable' => $config_vdir_enable,
      'nginx::config_process_user' => $config_process_user,
      'nginx::vhost_dir' => $vhost_dir
    }

  $base_params + $extra_params

}
