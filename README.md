Belatrix test:

1. Run 'gem install rspec'
2. If you want to run the test just use 'bundle exec rspec 'user_spec.rb'
3. If you want to run the script, run the following lines:
  `echo "User.new.inspect` #For no parameters
  `echo "User.new { { name: "David", last_name: "Valderrama"} } >> user.rb `#For hash parameters
  `echo "User.new { |user| user.name = "David"; user.last_name = "Valderrama" } >> user.rb `#For block parameters
