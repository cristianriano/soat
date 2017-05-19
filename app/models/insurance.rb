class Insurance < ApplicationRecord
  # Associations
  belongs_to :vehicle
  belongs_to :rate
  has_one :user, through: :vehicle

  # Methods
  alias_attribute :bought_at, :created_at

  # Scopes
  default_scope { order('created_at DESC') }
end
