require_relative 'pantograph_core/globals'
# Ruby monkey-patches - should be before almost all else
require_relative 'pantograph_core/core_ext/string'
require_relative 'pantograph_core/core_ext/shellwords'

require_relative 'pantograph_core/env'
require_relative 'pantograph_core/helper'
require_relative 'pantograph_core/configuration/configuration'
require_relative 'pantograph_core/update_checker/update_checker'
require_relative 'pantograph_core/command_executor'
require_relative 'pantograph_core/print_table'
require_relative 'pantograph_core/ui/ui'
require_relative 'pantograph_core/pantograph_folder'
require_relative 'pantograph_core/keychain_importer'
require_relative 'pantograph_core/swag'
require_relative 'pantograph_core/ui/errors'
require_relative 'pantograph_core/analytics/action_completion_context'
require_relative 'pantograph_core/analytics/action_launch_context'
require_relative 'pantograph_core/analytics/analytics_event_builder'
require_relative 'pantograph_core/analytics/analytics_ingester_client'
require_relative 'pantograph_core/analytics/analytics_session'
require_relative 'pantograph_core/tag_version'
require_relative 'pantograph_core/pantograph_pty'

# Third Party code
require 'colored'
require 'commander'

# after commander import
require_relative 'pantograph_core/ui/pantograph_runner' # monkey patch

require_relative 'pantograph_core/module'
