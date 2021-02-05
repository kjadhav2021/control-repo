#site-specific win user creation
class profile::winuser {
  lookup('users', Hash, 'hash').each | String $username, Hash $attrs | {
    user { $username:
        ensure => 'present',
        comment => $attrs['comment'],
        groups => $attrs['groups'],
        password =>$attrs['password'],
    }
  }

  lookup('groups', Hash, 'hash').each | String $groupname, Hash $attrs_grp | {
    user { $groupname:
        ensure => 'present',
        members => $attrs_grp['members'],
        provider => $attrs_grp['provider'],
    }
  }
}
