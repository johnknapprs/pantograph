module Pantograph
  module Actions
    module SharedValues
      [[NAME_UP]]_CUSTOM_VALUE = :[[NAME_UP]]_CUSTOM_VALUE
    end

    class [[NAME_CLASS]] < Action
      def self.run(params)
        # pantograph will take care of reading in the parameter and fetching the environment variable:
        UI.message("Parameter API Token: #{params[:api_token]}")

        # sh("shellcommand ./path")

        # Actions.lane_context[SharedValues::[[NAME_UP]]_CUSTOM_VALUE] = "my_val"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'A short description with <= 80 characters of what this action does'
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        'You can use this action to do cool things...'
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          PantographCore::ConfigItem.new(key: :api_token,
                                       env_name: '[[NAME_UP]]_API_TOKEN', # The name of the environment variable
                                       description: 'API Token for [[NAME_CLASS]]', # a short description of this parameter
                                       verify_block: proc do |value|
                                          UI.user_error!('No API token for [[NAME_CLASS]] given, pass using `api_token: "token"`') unless (value and not value.empty?)
                                       end),
          PantographCore::ConfigItem.new(key: :development,
                                       env_name: '[[NAME_UP]]_DEVELOPMENT',
                                       description: 'Create a development certificate instead of a distribution one',
                                       is_string: false, # true: verifies the input is a string, false: every kind of value
                                       default_value: false) # the default value if the user didn't provide one
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['[[NAME_UP]]_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to pantograph :) You are awesome btw!
        ['Your GitHub/Twitter Name']
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :linux
        # 
        #  [:linux, :mac].include?(platform)
        # 
        true
      end
    end
  end
end
