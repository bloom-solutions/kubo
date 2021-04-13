module Kubo
  class Deploy

    CONFIG_PATH = File.join(Dir.getwd, "/.kubo.yml").freeze
    CONFIG      = YAML.load_file(CONFIG_PATH).freeze

    attr_reader :environment, :branch

    def initialize(environment, branch)
      @environment = environment
      @branch = branch
    end

    def config
      return @config if @config

      if not CONFIG.has_key?(environment)
        fail "No config in #{CONFIG_PATH} found for #{environment}"
      end

      @config = CONFIG[environment].with_indifferent_access
    end

    def start
      complete_cmd = "#{render_cmd} | #{deploy_cmd}"

      puts "Running command: #{complete_cmd}"

       deploy_stdout, deploy_stderr, deploy_status =
         run_command("#{complete_cmd}")

       if not deploy_status.success?
         msg = "Failed to deploy: " \
           "#{deploy_stdout} -" \
           "#{deploy_stderr}"
         fail msg
       end
    end

    def render_cmd
      args = {
        "current-sha": current_sha,
        "filename": "config/deploy/#{environment}",
      }.each_with_object([]) do |(key, val), arr|
        next if val.blank?
        arr << ["--#{key}", val].join("=")
      end.join(" ")

      [
        "krane",
        "render",
        args
      ].join(" ")
    end

    def current_sha
      complete_cmd = "git rev-parse --verify #{branch}"

      puts "Running command: #{complete_cmd}"

      git_stdout, git_stderr, git_status =
        run_command(complete_cmd)

      git_stdout
    end

    def deploy_cmd
      namespace = config[:namespace]
      cluster = config[:cluster]

      args = {
        "filename": "config/deploy/#{environment}/secrets.ejson",
      }.each_with_object([]) do |(key, val), arr|
        next if val.blank?
        arr << ["--#{key}", val].join("=")
      end.join(" ")

      [
        "krane",
        "deploy",
        namespace,
        '$CLUSTER',
        "--stdin",
        args
      ].join(" ")
    end

    def run_command(command)
      Open3.capture3(command)
    end

  end
end
