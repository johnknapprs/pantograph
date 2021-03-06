module Pantograph
  class PluginInfo
    attr_reader :plugin_name
    attr_reader :author
    attr_reader :gem_name
    attr_reader :email
    attr_reader :summary
    attr_reader :details

    def initialize(plugin_name, author, email, summary, details)
      @plugin_name = plugin_name
      @author = author
      @email = email
      @summary = summary
      @details = details
    end

    def gem_name
      "#{Pantograph::PluginManager::PANTOGRAPH_PLUGIN_PREFIX}#{plugin_name}"
    end

    def require_path
      gem_name.tr('-', '/')
    end

    def actions_path
      File.join(require_path, 'actions')
    end

    def helper_path
      File.join(require_path, 'helper')
    end

    # Used to expose a local binding for use in ERB templating
    #
    # rubocop:disable Style/AccessorMethodName
    def get_binding
      binding
    end
    # rubocop:enable Style/AccessorMethodName

    def ==(other)
      @plugin_name == other.plugin_name &&
        @author == other.author &&
        @email == other.email &&
        @summary == other.summary
    end
  end
end
