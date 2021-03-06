module Pantograph
  class SetupGeneric < Setup
    # attr_accessor :package_name

    def setup_gradle
      # self.platform = :generic

      welcome_to_pantograph

      self.pantfile_content = pantfile_template_content

      fetch_information

      PantographCore::PantographFolder.create_folder!

      self.append_lane([
                         "desc 'Runs all the  tests'",
                         "lane :test do",
                         "  maven(task: 'clean install')",
                         "end"
                       ])

      self.append_lane([
                         "desc 'Publish new version to Artifactory'",
                         "lane :build do",
                         "  maven(task: 'clean build')",
                         "end"
                       ])

      self.append_lane([
                         "desc 'Deploy a new version to Artifactory'",
                         "lane :publish do",
                         "  maven(task: 'clean deploy')",
                         "end"
                       ])

      self.lane_to_mention = "test"

      finish_up
    end

    def fetch_information
      # UI.message('')
      # UI.message("To avoid re-entering your package name and issuer every time you run pantograph, we'll store those in a so-called Appfile.")

      # self.package_name = UI.input("Package Name (com.krausefx.app): ")
      # puts("")
      # puts("To automatically upload builds and metadata to Google Play, pantograph needs a service account json secret file".yellow)
      # puts("Feel free to press Enter at any time in order to skip providing pieces of information when asked")
    end

    def finish_up
      # self.pantfile_content.gsub!(":generic", ":generic")

      super
    end
  end
end
