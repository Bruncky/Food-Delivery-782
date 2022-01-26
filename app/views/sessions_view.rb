class SessionsView
  def ask_user_for(stuff)
    puts "#{stuff}?"
    print '> '

    gets.chomp
  end

  def valid_credentials(username)
    puts "You have been signed in. Welcome #{username}"
  end

  def invalid_credentials
    puts 'Wrong credentials. Try again!'
  end
end
