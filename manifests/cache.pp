class glance::cache(
  $log_verbose = 'False',
  $log_debug = 'False',
  $bind_host = '0.0.0.0',
  $bind_port = '9292',
  $backlog   = '4096',
  $workers   = '0',
  $log_file = '/var/log/glance/api.log',
  $registry_host = '0.0.0.0',
  $registry_port = '9191',
  $auth_type = 'keystone',
  $auth_host = '127.0.0.1',
  $auth_port = '35357',
  $auth_protocol = 'http',
  $auth_uri = "http://127.0.0.1:5000/",
  $keystone_tenant = 'admin',
  $keystone_user = 'admin',
  $keystone_password = 'ChangeMe',
  $enabled           = true,
  $sql_connection    = 'sqlite:///glance.sqlite',
  $sql_idle_timeout  = '3600',
) inherits glance {

  # used to configure concat
  include 'concat::setup'
  require 'keystone::python'


  concat { '/etc/glance/glance-cache.conf':
    owner   => 'glance',
    group   => 'root',
    mode    => 640,
    require => Class['glance'],
  }


  glance::cache::config{ 'header':
    config => {
        'log_verbose' => $log_verbose,
        'log_debug' => $log_debug,
        'registry_host' => $registry_host,
        'registry_port' => $registry_port,
        'auth_type' => $auth_type,
        'keystone_tenant' => $keystone_tenant,
        'keystone_user' => $keystone_user,
        'keystone_password' => $keystone_password,
    },
    order => '01',
  }
  
  

  glance::cache::config{ 'footer':
    config => {
    },
    order => '99',
  }


}
