namespace :test do
  task :all do
    BUNDLE_EXEC = 'bundle exec'

    test_types = {
      brakeman: { command: "#{BUNDLE_EXEC} brakeman", success: true },
      bundle_audit: { command: "#{BUNDLE_EXEC} bundle audit --update", success: true },
      rubocop: { command: "#{BUNDLE_EXEC} rubocop", success: true },
      rspec: { command: "#{BUNDLE_EXEC} rspec", success: true },
    }

    tmp_errors = []

    test_types.each do |k, v|
      v[:success] = system("#{v[:command]}")
      tmp_errors << "#{k}" unless v[:success]
    end

    puts "Errors found in: #{tmp_errors.join(', ')}"
  end
end
