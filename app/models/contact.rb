class Contact < ApplicationRecord
  has_many :events, dependent: :destroy
end
