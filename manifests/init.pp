# Class: nginx
# ===========================
#
# Full description of class nginx here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'nginx':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class nginx(
  String $ensure,
  String $package_name,
  String $config_dir,
  String $config_ensure,
  String $config_mode,
  String $config_owner,
  String $config_group,
  String $config_confd,
  String $config_log_dir,
  String $config_pid_file,
  Optional[String] $config_vdir_enable,
  String $config_process_user,
  String $service_pattern,
  String $service_ensure,
  String $service_name,
  String $vhost_dir,
  Boolean $service_enable,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  String $docroot,
) {
  class {'::nginx::install':}
  -> class {'::nginx::config':}
  ~> class {'::nginx::service':}
}
