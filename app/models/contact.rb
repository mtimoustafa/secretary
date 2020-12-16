class Contact < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :email, presence: { message: 'Email field cannot be blank' }
end
