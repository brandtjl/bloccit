class FavoriteMailer < ApplicationMailer
    default from: "jenibrandt@legalshieldcorp.com"

    def new_comment(user, post, comment)
        #new_comment has a matching view that is 'envoked'?
# #18
        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @user = user
        @post = post
        @comment = comment

    # #19
        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(post)
        headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"
            #why is one of the above 'posts' and the others 'post'?
        @post = post
        mail(to: post.user.email, subject: "Favorited post #{post.title}")

    end

end
