module Wiki
  class Application < Rails::Application
    # Loads vars defined in `config/env.yml`
    # to ENV for current environment.
    config.before_configuration do
      filepath = File.join(Rails.root, "config", "env.yml")
      env = YAML.load_file(filepath)[Rails.env]
      env.each { |key, val| ENV[key] = val }
    end
  end
end

