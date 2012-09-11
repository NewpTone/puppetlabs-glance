#
# Can be used to specify configuration
# sections in glance-api.conf
#
# It will assume that the config
#
#
define glance::cache::config(
  $config    = {},
  $file_name = regsubst($name, ':', '_', 'G'),
  $content   = template("glance/cache/${name}.erb"),
  $order     = undef
) {

  concat::fragment { "glance-cache-${name}":
    target  => '/etc/glance/glance-cache.conf',
    content => $content,
    order   => $order,
  }

}

