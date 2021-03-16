# @summary
# A profile class for the web server.
#
# It installs iis server and its components.
#
# @example
#   include profile::iis_server
class profile::iis_server {
  include users::iis_server
}
