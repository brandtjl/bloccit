require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advert) {Advertisement.create!(title: "New Advertisement Title", copy: "New Advertisement Copy", price: 12) }

  describe "attributes" do
    it "has title, copy and price attributes" do
      expect(advert).to have_attributes(title: "New Advertisement Title", copy: "New Advertisement Copy", price: 12)
    end
  end 
  
end
