require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:name) { RandomData.random_sentence } #topic name
  let(:description) { RandomData.random_paragraph } # topic description
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) {rand(1..50)}
# #3
  let(:topic) { Topic.create!(name: name, description: description) }
# #4
  let(:post) { topic.sponsored_posts.create!(title: title, body: body, price: price) } #failing here??

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "had title and body attributes" do 
      expect(post).to have_attributes(title: title, body: body, price: price)
    end 
  end end
