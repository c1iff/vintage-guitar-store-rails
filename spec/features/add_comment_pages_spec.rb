require 'rails_helper'

describe "the add a prduct process" do
  it "adds a product when loged in an admin" do
    user = create(:user)
    product = create(:product)
    visit '/'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Guitars'
    click_on 'Gibson Les Paul'
    click_on 'Add a Comment'
    fill_in 'Enter Comment', :with => 'This is a test comment.'
    click_on 'Create Comment'
    expect(page).to have_content "This is a test comment."
  end
end
