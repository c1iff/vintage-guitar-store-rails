require 'rails_helper'

describe "the add a user process" do
  it "tell you to login when first going to the site" do
    visit '/'
    expect(page).to have_content "Log in"
  end

  it "adds a new user" do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', :with => 'test_user@test.com'
    fill_in 'User name', :with => 'testUser'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Clifford Guitars'
  end


  it "gives error when no email is entered" do
    visit '/'
    click_link 'Sign up'
    click_on 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end

  it "gives admin privilages when loged in an admin" do
    user = create(:user)
    visit '/'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Guitars'
    expect(page).to have_content "Add a Product"
  end
end
