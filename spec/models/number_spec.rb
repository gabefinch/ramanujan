require 'spec_helper'
require 'rails_helper'

describe Number do
  it { should have_many :messages }
  it { should belong_to :user }
end
