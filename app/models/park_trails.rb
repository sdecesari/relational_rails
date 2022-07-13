class ParkTrails < ApplicationRecord
  belongs_to :park
  belongs_to :trail
end
