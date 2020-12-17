require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:contact) { Contact.new(email: 'test@test.com') }

  it 'is valid with valid attributes' do
    expect(contact.events.new(event_type: 'processed', timestamp: 1234567, sg_event_id: 'test_id')).to be_valid
  end
end
