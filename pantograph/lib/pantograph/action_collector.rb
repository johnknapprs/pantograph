module Pantograph
  class ActionCollector
    def show_message
      UI.message("Sending Crash/Success information. Learn more at https://urbanquakers.github.io/pantograph/#metrics")
      UI.message("No personal/sensitive data is sent. Only sharing the following:")
      UI.message(launches)
      UI.message(@error) if @error
      UI.message("This information is used to fix failing actions and improve integrations that are often used.")
      UI.message("You can disable this by adding `opt_out_usage` at the top of your Pantfile")
    end

    def determine_version(name)
      self.class.determine_version(name)
    end

    # e.g.
    #   :gym
    #   :xcversion
    #   "pantograph-plugin-my_plugin/xcversion"
    def self.determine_version(name)
      if name.to_s.include?(PluginManager.plugin_prefix)
        # That's an action from a plugin, we need to fetch its version number
        begin
          plugin_name = name.split("/").first.gsub(PluginManager.plugin_prefix, '')
          return Pantograph.const_get(plugin_name.pantograph_class)::VERSION
        rescue => ex
          UI.verbose(ex)
          return 'undefined'
        end
      end

      return Pantograph::VERSION # that's the case for all built-in actions
    end
  end
end
