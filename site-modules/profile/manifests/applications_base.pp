# @summary
# This is a profile class.
#
# It installs 7zip and notepad plus plus on user machines using chocolatey repo.
#
# @example
#   include profile::applications_base
class profile::applications_base {
  users::install_using_chocolatey { '7zip':
    package_name   => '7zip',
    reboot_machine => false,
  }
  users::install_using_chocolatey { 'notepadplusplus.install':
    package_name   => 'notepadplusplus.install',
    reboot_machine => true,
  }
}
