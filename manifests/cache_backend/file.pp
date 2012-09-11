#
# used to configure file backends for glance
#
#  $filesystem_store_datadir - Location where dist images are stored when
#  default_store == file.
#  Optional. Default: /var/lib/glance/images/
class glance::cache_backend::file(
  $filesystem_store_datadir = '/var/lib/glance/images/'
) inherits glance::cache {

  #
  # modeled as its own config define so that any attempts to
  # define multiple backends will fail
  #

  # configure directory where files should be stored
  glance::cache::config { 'file':
    config => {
      'filesystem_store_datadir' => $filesystem_store_datadir
    },
    order  => '02',
    require => Glance::Cache::Config['header'],
  }
}
