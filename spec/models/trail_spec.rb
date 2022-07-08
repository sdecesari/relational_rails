require 'rails_helper'

RSpec.describe Trail, type: :model do
   describe "validations" do 
      it { should validate_presence_of :name } 
      it { should validate_presence_of :difficulty} 
      it { should allow_value(true).for (:open) }
      it { should allow_value(false).for :open }
   end 

   describe "relationships" do 
      it { should belong_to :park}
   end
end 