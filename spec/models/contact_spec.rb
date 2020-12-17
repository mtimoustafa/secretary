require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is valid with valid attributes' do
    expect(Contact.new(email: 'test@test.com')).to be_valid
  end

  describe '#email' do
    it 'is required' do
      expect(Contact.new).to_not be_valid
    end
  end
end
