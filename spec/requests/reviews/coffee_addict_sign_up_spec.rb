require "spec_helper"


feature %q{
  When I sign up to coffee matrix
  I should be able to add reviews
} do

  scenario 'when I sign up and log in I should be able to add reviews' do

    visit root_path

    click_link 'Sign up'
    fill_in 'Username', :with => 'foo'
    fill_in 'Email', :with => 'foo@bar.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'

    find('.alert').text.strip.should =~ /Successfully signed up/

    click_link 'Log in'
    fill_in 'Username', :with => 'foo'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'

    page.should have_content('write review')
  end

end
