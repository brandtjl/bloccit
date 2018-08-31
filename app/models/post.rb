class Post < ApplicationRecord
    belongs_to :topic
    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    default_scope { order('rank DESC') }
    
    validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

   after_create :auto_favorite

   def up_votes
    # #9
        votes.where(value: 1).count
    end
    
    def down_votes
# #10
    votes.where(value: -1).count
    end
    
    def points
# #11
    votes.sum(:value)
    end
    # 'votes' in above methods is an implied self.votes

    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
        new_rank = points + age_in_days
        update_attribute(:rank, new_rank)
    end

    def auto_favorite
        Favorite.create(post: self, user: self.user)
        # when doing an action on the instance that's calling the method (in a model), use self
        # post = self because it's in the Post model and this action is happening after a Post is created
        
    end
end
