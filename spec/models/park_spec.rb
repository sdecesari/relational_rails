require 'rails_helper'

RSpec.describe Park, type: :model do 
   describe "validations" do 
      it { should validate_presence_of :name } 
      it { should validate_presence_of :daily_visitors } 
      it { should allow_value(true).for (:cost) }
      it { should allow_value(false).for (:cost) }
   end

   describe "relationships" do 
      it { should have_many :trails}
   end
end 