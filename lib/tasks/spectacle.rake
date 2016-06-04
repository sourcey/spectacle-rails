namespace :spectacle do

  desc "Install Spectacle engine"
  task install: [:environment] do |t,args|
    Spectacle::DSL.install
  end

  desc "Generate Spectacle documentation"
  task generate: [:environment] do |t,args|
    Spectacle::DSL.generate
    Spectacle::DSL.copy_static
  end
end
