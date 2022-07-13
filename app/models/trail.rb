class Trail < ApplicationRecord
  belongs_to :park
  validates_presence_of :name
  validates_presence_of :difficulty
  validates :open, inclusion: [true, false]
end

  def self.open
    where(open: true)
  end

  def self.alphabetical_order
    order(name: :asc)
  end
