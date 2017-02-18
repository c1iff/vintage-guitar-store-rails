require 'rails_helper'

describe "the add a product to the cart process" do
  it "adds a product to the cart" do
    user = create(:user)
    product = create(:product)
    visit '/'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Guitars'
    click_on 'Gibson Les Paul'
    click_on 'Add to Cart'
    visit '/products/1/carts'
    expect(page).to have_content "Gibson Les Paul"
  end
end
