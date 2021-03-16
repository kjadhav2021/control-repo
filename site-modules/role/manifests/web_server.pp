# @summary
#  It is the role class for web server machine.It includes profiles accounts_server_base, server_default_settings, iis_server
#  and applications_base.
#
# @profile
#  accounts_server_base
#  server_default_settings
#  iis_server
#  applications_base
#
# @example
#  include role::web_server
class role::web_server {
  include profile::accounts_server_base
  include profile::server_default_settings
  include profile::iis_server
  include profile::applications_base
}
