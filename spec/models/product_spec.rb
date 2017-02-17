require 'rails_helper'

describe Product do
  it { should have_many :comments }
  it { should have_many(:users).through :comments }
end
