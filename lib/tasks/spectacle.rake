namespace :spectacle do

  desc "Install the spectacle-docs npm package globally"
  task install: [:environment] do |t, args|
    Spectacle::DSL.install
  end

  desc "Generate API documentation from your OpenAPI spec"
  task generate: [:environment] do |t, args|
    Spectacle::DSL.generate
  end

  desc "Validate your OpenAPI spec file"
  task validate: [:environment] do |t, args|
    Spectacle::DSL.validate
  end
end
