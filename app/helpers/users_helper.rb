module UsersHelper

    def has_posts(user)
        user.posts.count
    end

    def has_comments(user)
        user.comments.count
    end

    def has_favorites(user)
        user.favorites.count
    end
end
