class FavoriteMailer < ApplicationMailer
    default from: "jenibrandt@legalshieldcorp.com"

    def new_comment(user, post, comment)
 
        # #18
            headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
            # not sure why plural 'comments'(above) but singular 'post' (below)
            headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
            headers["References"] = "<post/#{post.id}@your-app-name.example>"
        
            @user = user
            @post = post
            @comment = comment
        #why are @user, @post, and @comment necessary? 

        # #19
            mail(to: user.email, subject: "New comment on #{post.title}")
            
          end

    def new_post(user, post)
        headers["Message-ID"] = "<posts/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"
    
        @user = user
        @post = post
    
    # #19
        mail(to: user.email, subject: "New favorited post: #{post.title}")
    end

end
