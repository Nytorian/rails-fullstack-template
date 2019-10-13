task :rename do
  STDOUT.puts "Enter the new project name:"

  tmp_name = STDIN.gets.strip
  success = system("rails g rename:app_to '#{tmp_name}'")
  puts(success ? 'Success!' : 'Something went wrong!')

  new_dir_name = Rails.root.to_s.gsub('rails-fullstack-template', tmp_name)
  success = system("cd #{new_dir_name}") if success

  puts "Go to: #{new_dir_name}" unless success
end
