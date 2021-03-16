# @summary
# A profile class for the user machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings include IEESC configuration and enabling shutdown event tracker.
#
# @example
#   include profile::default_settings
class profile::default_settings {
  users::set_registry_value { 'configure_IEESC':
    registry_value_path => 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled',
    registry_enable     => 'present',
    registry_value_type => 'dword',
    registry_data_value => '0x00000001',
  }

  users::set_registry_value { 'configure_shutdown_event_tracker':
    registry_value_path => 'HKLM\Software\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI',
    registry_enable     => 'present',
    registry_value_type => 'dword',
    registry_data_value => '0x00000001',#0x00000001
  }
}
