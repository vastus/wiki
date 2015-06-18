module Wiki
  class Application < Rails::Application
    # Loads vars defined in `config/env.yml`
    # to ENV for current environment.
    filepath = File.join(Rails.root, "config", "env.yml")
    config.before_configuration do
      env = YAML.load_file(filepath)[Rails.env]
      env.each { |key, val| ENV[key] = val }
    end if File.exists?(filepath)
  end
end

