# @summary
# A profile class for the user machine.
#
# It creates local accounts for users and groups based on values provided in the data file common.yaml.
# It also provides directory rights for given directory path and local account.
#
# @example
#   include profile::accounts_base
class profile::accounts_base {
  lookup('users',Hash,'hash').each | String $username, Hash $attrs | {
    user{ $username:
      ensure     => 'present',
      comment    => $attrs['comment'],
      groups     => $attrs['groups'],
      password   => $attrs['password'],
      membership => 'inclusive',
    }
  }
  lookup('groups',Hash,'hash').each | String $groupname, Hash $grpattrs | {
    group{ $groupname:
      ensure  =>'present',
      members => $grpattrs['members'],
    }
  }
  # users::directory_rights { 'configure_rights_administrator':
  #   directory_title => 'acltestDir',
  #   directory_path  => 'C:/acltestDir/',
  #   account_name    => 'Administrator',
  #   rights          => 'full',
  # }
  # users::directory_rights { 'configure_rights_alice':
  #   directory_title => 'acltestDir_alice',
  #   directory_path  => 'C:/acltestDir/',
  #   account_name    => 'Alice',
  #   rights          => 'full',
  # }
  # users::directory_rights { 'configure_rights_developers':
  #   directory_title => 'acltestDir_dev',
  #   directory_path  => 'C:/acltestDir/',
  #   account_name    => 'Developers',
  #   rights          => 'read',
  # }
  $directory = 'C:/acltestDir/'
  users::directory_rights {
    'configure_rights_developers':
      directory_title => 'acltestDir_dev',
      directory_path  => $directory,
      account_name    => 'Developers',
      rights          => 'read',
    ;
  }
}
