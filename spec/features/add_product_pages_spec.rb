require 'rails_helper'

describe "the add a prduct process" do
  it "adds a product when loged in an admin" do
    user = create(:user)
    visit '/'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Guitars'
    click_on 'Add a Product'
    fill_in 'Enter Product Name', :with => 'Gibson Les Paul'
    fill_in 'Enter Description', :with => 'This is a test description'
    fill_in 'Enter the Price', :with => '5000'
    click_on 'Create Product'
    expect(page).to have_content "Gibson Les Paul"
  end
end
