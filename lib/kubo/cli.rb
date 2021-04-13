module Kubo
  class CLI < Thor

    CONFIG_PATH = File.join(Dir.pwd, "/.kubo.yml").freeze
    CONFIG      = YAML.load_file(CONFIG_PATH).freeze

    desc "start deployment of branch for environment", "Deploy branch to enviroment"

    def deploy(environment, branch)
      Deploy.new(environment, branch).start
    end

  end
end

