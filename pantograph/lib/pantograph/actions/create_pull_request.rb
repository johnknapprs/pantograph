module Pantograph
  module Actions
    module SharedValues
      CREATE_PULL_REQUEST_HTML_URL = :CREATE_PULL_REQUEST_HTML_URL
    end

    class CreatePullRequestAction < Action
      def self.run(params)
        UI.message("Creating new pull request from '#{params[:head]}' to branch '#{params[:base]}' of '#{params[:repo]}'")

        payload = {
          'title' => params[:title],
          'head' => params[:head],
          'base' => params[:base]
        }
        payload['body'] = params[:body] if params[:body]

        GithubApiAction.run(
          server_url: params[:api_url],
          api_token: params[:api_token],
          http_method: 'POST',
          path: "repos/#{params[:repo]}/pulls",
          body: payload,
          error_handlers: {
            '*' => proc do |result|
              UI.error("GitHub responded with #{result[:status]}: #{result[:body]}")
              return nil
            end
          }
        ) do |result|
          json = result[:json]
          number = json['number']
          html_url = json['html_url']
          UI.success("Successfully created pull request ##{number}. You can see it at '#{html_url}'")

          # Add labels to pull request
          add_labels(params, number) if params[:labels]

          # Add assignees to pull request
          add_assignees(params, number) if params[:assignees]

          Actions.lane_context[SharedValues::CREATE_PULL_REQUEST_HTML_URL] = html_url
          return html_url
        end
      end

      def self.add_labels(params, number)
        payload = {
          'labels' => params[:labels]
        }
        GithubApiAction.run(
          server_url: params[:api_url],
          api_token: params[:api_token],
          http_method: 'PATCH',
          path: "repos/#{params[:repo]}/issues/#{number}",
          body: payload,
          error_handlers: {
            '*' => proc do |result|
              UI.error("GitHub responded with #{result[:status]}: #{result[:body]}")
              return nil
            end
          }
        )
      end

      def self.add_assignees(params, number)
        payload = {
          'assignees' => params[:assignees]
        }
        GithubApiAction.run(
          server_url: params[:api_url],
          api_token: params[:api_token],
          http_method: 'POST',
          path: "repos/#{params[:repo]}/issues/#{number}/assignees",
          body: payload,
          error_handlers: {
            '*' => proc do |result|
              UI.error("GitHub responded with #{result[:status]}: #{result[:body]}")
              return nil
            end
          }
        )
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "This will create a new pull request on GitHub"
      end

      def self.output
        [
          ['CREATE_PULL_REQUEST_HTML_URL', 'The HTML URL to the created pull request']
        ]
      end

      def self.available_options
        [
          PantographCore::ConfigItem.new(key: :api_token,
                                       env_name: "GITHUB_PULL_REQUEST_API_TOKEN",
                                       description: "Personal API Token for GitHub - generate one at https://github.com/settings/tokens",
                                       sensitive: true,
                                       code_gen_sensitive: true,
                                       default_value: ENV["GITHUB_API_TOKEN"],
                                       default_value_dynamic: true,
                                       type: String,
                                       optional: false),
          PantographCore::ConfigItem.new(key: :repo,
                                       env_name: "GITHUB_PULL_REQUEST_REPO",
                                       description: "The name of the repository you want to submit the pull request to",
                                       type: String,
                                       optional: false),
          PantographCore::ConfigItem.new(key: :title,
                                       env_name: "GITHUB_PULL_REQUEST_TITLE",
                                       description: "The title of the pull request",
                                       type: String,
                                       optional: false),
          PantographCore::ConfigItem.new(key: :body,
                                       env_name: "GITHUB_PULL_REQUEST_BODY",
                                       description: "The contents of the pull request",
                                       type: String,
                                       optional: true),
          PantographCore::ConfigItem.new(key: :labels,
                                       env_name: "GITHUB_PULL_REQUEST_LABELS",
                                       description: "The labels for the pull request",
                                       type: Array,
                                       optional: true),
          PantographCore::ConfigItem.new(key: :head,
                                       env_name: "GITHUB_PULL_REQUEST_HEAD",
                                       description: "The name of the branch where your changes are implemented (defaults to the current branch name)",
                                       type: String,
                                       code_gen_sensitive: true,
                                       default_value: Actions.git_branch,
                                       default_value_dynamic: true,
                                       optional: true),
          PantographCore::ConfigItem.new(key: :base,
                                       env_name: "GITHUB_PULL_REQUEST_BASE",
                                       description: "The name of the branch you want your changes pulled into (defaults to `master`)",
                                       type: String,
                                       default_value: 'master',
                                       optional: true),
          PantographCore::ConfigItem.new(key: :api_url,
                                       env_name: "GITHUB_PULL_REQUEST_API_URL",
                                       description: "The URL of GitHub API - used when the Enterprise (default to `https://api.github.com`)",
                                       type: String,
                                       code_gen_default_value: 'https://api.github.com',
                                       default_value: 'https://api.github.com',
                                       optional: true),
          PantographCore::ConfigItem.new(key: :assignees,
                                       env_name: "GITHUB_PULL_REQUEST_ASSIGNEES",
                                       description: "The assignees for the pull request",
                                       type: Array,
                                       optional: true)
        ]
      end

      def self.author
        ['seei', 'tommeier', 'marumemomo', 'johnknapprs']
      end

      def self.is_supported?(platform)
        return true
      end

      def self.return_value
        "The pull request URL when successful"
      end

      def self.example_code
        [
          'create_pull_request(
            api_token: "secret",                # optional, defaults to ENV["GITHUB_API_TOKEN"]
            repo: "urbanquakers/pantograph",
            title: "Amazing new feature",
            head: "my-feature",                 # optional, defaults to current branch name
            base: "master",                     # optional, defaults to "master"
            body: "Please pull this in!",       # optional
            api_url: "http://yourdomain/api/v3" # optional, for GitHub Enterprise, defaults to "https://api.github.com"
          )'
        ]
      end

      def self.category
        :source_control
      end
    end
  end
end
