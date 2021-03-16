# @summary
# A profile class for the web server machine.
#
# It creates local accounts for users and groups based on values provided in the data file common.yaml.
# It provides directory rights for given directory path and local account. Also, it enables logon as a service
# for user id.
#
# @example
#   include profile::accounts_server_base
class profile::accounts_server_base {
  lookup('users_server',Hash,'hash').each | String $username, Hash $attrs | {
    user{ $username:
      ensure     => 'present',
      comment    => $attrs['comment'],
      groups     => $attrs['groups'],
      password   => $attrs['password'],
      membership => 'inclusive',
    }
  }
  lookup('groups_server',Hash,'hash').each | String $groupname, Hash $grpattrs | {
    group{ $groupname:
      ensure  =>'present',
      members => $grpattrs['members'],
    }
  }
  users::directory_rights { 'configure_rights_developers':
    directory_title => 'pos_reports',
    directory_path  => 'C:/pos_reports/',
    account_name    => 'Developers',
    rights          => 'read',
  }
  users::user_policy_management { 'configure_logon_service':
    ensure                => 'present',
    security_policy       => 'Log on as a service',
    security_policy_value => 'cloudbase-init,webapp',
  }
}
