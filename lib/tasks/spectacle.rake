namespace :spectacle do

  desc "Generate Spectacle static documentation"
  task docs: [:environment] do |t,args|
    # results = Spectacle::Generator.write_docs(Spectacle::Config.registered_apis)
    # results.each do |k,v|
    #   puts "#{k}: #{v[:processed].count} processed / #{v[:skipped].count} skipped"
    # end
  end
end
