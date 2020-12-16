class Event < ApplicationRecord
  belongs_to :contact

  event_types = ['processed', 'dropped', 'delivered', 'deferred', 'bounce', 'blocked', 'open', 'click', 'spamreport', 'unsubscribe', 'group_unsubscribe', 'group_resubscribe']
  enum event_type: [event_types, event_types].to_h # Every enum value represented as a string of itself
end
