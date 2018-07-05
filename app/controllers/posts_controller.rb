class PostsController < ApplicationController
  def index
    @posts = Post.all  # why is this Post.all and not Posts.all? in 2018.._create_posts.rb it says 'create_table posts'
    @posts.each_with_index do |post, index|
      if index % 5 == 0
        post.title = 'SPAM'
      end 
    end 
  end

  def show
  end

  def new
  end

  def edit
  end
end
