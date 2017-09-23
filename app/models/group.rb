class Group < ApplicationRecord
  has_many :group_contacts
  has_many :contacts, through: :group_contacts
end
