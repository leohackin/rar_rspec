require 'spec_helper'

describe Member do
  it 'should be invalid without name' do
    Member.new(:name => "").should_not be_valid
  end

  it 'should be invalid without email' do
    Member.new(:name => "Almir")
  end

end
