class Event < ApplicationRecord
  belongs_to :contact

  enum event_type: [
    :processed
    :dropped
    :delivered
    :deferred
    :bounce
    :blocked
    :open
    :click
    :spamreport
    :unsubscribe
    :group_unsubscribe
    :group_resubscribe
  ]
end
