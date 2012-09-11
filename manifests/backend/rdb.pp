#
# configures the storage backend for glance
# as a s3 instance
#
#  
class glance::backend::rdb(
  $user = 'glance',
  $chunk_size = '8',
  $delayed_delete = 'False',
  $scrub_time = '43200',
) inherits glance::api {

  #
  # modeled as its own config define so that any attempts to
  # define multiple backends will fail
  #
  glance::api::config { 'backend':
    config => {
      'default_store' => 'rdb',
    },
    order  => '04',
  }

  glance::api::config { 'rdb':
    config => {
      'user' => $user,
      'chunk_size'  => $chunk_size,
      'delayed_delete' => $delayed_delete,
      'scrub_time' => $scrub_time,
    },
    order  => '05',
  # this just needs to configure a section
  # in glance-api.conf
  }
}
