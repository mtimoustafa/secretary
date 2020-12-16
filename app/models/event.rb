class Event < ApplicationRecord
  belongs_to :contact

  event_types = ['processed', 'dropped', 'delivered', 'deferred', 'bounce', 'blocked', 'open', 'click', 'spamreport', 'unsubscribe', 'group_unsubscribe', 'group_resubscribe']
  enum event_type: event_types.zip(event_types).to_h # Every enum value represented as a string of itself

  validates :contact, presence: true
  validates :event_type, inclusion: { in: event_types, message: 'Invalid event type' }
  validates :timestamp, numericality: { only_integer: true, message: 'timestamp must be in Unix format' }
end
