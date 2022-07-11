class Park < ApplicationRecord
   has_many :trails, dependent: :destroy
   validates_presence_of :name
   validates_presence_of :daily_visitors
   validates :cost, inclusion: [true, false]

   def self.ordered
     order(created_at: :asc)
   end

   def park_count
      trails.count
   end
end
