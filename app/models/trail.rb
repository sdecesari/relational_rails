class Trail < ApplicationRecord
  belongs_to :park
  validates_presence_of :name
  validates_presence_of :difficulty
  validates :open, inclusion: [true, false]
end

  def self.open
    where(open: true).to_a
  end

  def self.sort
    order(:name)
  end
