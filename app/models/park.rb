class Park < ApplicationRecord
   has_many :trails
   validates_presence_of :name
   validates_presence_of :daily_visitors
   validates :cost, inclusion: [true, false]
end