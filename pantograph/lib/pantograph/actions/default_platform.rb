module Pantograph
  module Actions
    module SharedValues
      DEFAULT_PLATFORM = :DEFAULT_PLATFORM
    end

    class DefaultPlatformAction < Action
      def self.run(params)
        if params.first.nil?
          UI.user_error!('You forgot to pass the default platform')
        end

        platform = params.first.to_sym

        SupportedPlatforms.verify!(platform)

        Actions.lane_context[SharedValues::DEFAULT_PLATFORM] = platform
      end

      def self.description
        'Defines a default platform to not have to specify the platform'
      end

      def self.output
        [
          ['DEFAULT_PLATFORM', 'The default platform']
        ]
      end

      def self.example_code
        [
          'default_platform(:gradle)'
        ]
      end

      def self.category
        :misc
      end

      def self.author
        'KrauseFx'
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
