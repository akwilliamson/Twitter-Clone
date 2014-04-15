require 'spec_helper'

describe User do
  it { should have_many :tweets }
  it { should have_many :followers }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
end
