require 'rails_helper'

describe Comment do
  it { should belong_to :product }
  it { should belong_to :user }
end
