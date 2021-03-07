module SignInSupport
  def basic_pass(path)
    username = ENV["BASIC_AUTH_USER"]
    password = ENV["BASIC_AUTH_PASSWORD"]
  
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
  
  def sign_in(user)
    visit root_path
    basic_pass new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on ('ログイン')
    expect(current_path).to eq(root_path)
  end
end