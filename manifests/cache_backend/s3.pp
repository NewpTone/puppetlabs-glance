#
# configures the storage backend for glance
# as a s3 instance
#
#  
class glance::cache_backend::s3(
  $host = '127.0.0.1:8080/v1.0/',
  $access_key = '<20-char AWS access key>',
  $secret_key = '<40-char AWS secret key>',
  $bucket = '<lowercased 20-char aws access key>glance',
  $iscreate = 'False',
) inherits glance::cache {

  #
  # modeled as its own config define so that any attempts to
  # define multiple backends will fail
  #

  glance::cache::config { 's3':
    config => {
      'host' => $host,
      'access_key'  => $access_key,
      'secret_key' => $secret_key,
      'bucket' => $bucket,
      'iscreate' => $iscreate,
    },
    order  => '02',
  # this just needs to configure a section
  # in glance-api.conf
  }
}
