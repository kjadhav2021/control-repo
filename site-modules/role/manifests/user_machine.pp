# @summary
#  It is the role class for user machine.It includes profiles accounts_base, default_settings and applications_base.
#
# @profile
#  accounts_base
#  default_settings
#  applications_base
#
# @example
#  include role::user_machine

class role::user_machine {
  include profile::accounts_base
  include profile::default_settings
  include profile::applications_base
}
