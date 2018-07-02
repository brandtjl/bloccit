require 'random_data'

50.times do
    Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )
end

posts = Post.all

100.times do
    Comment.create!(    
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

myPost = Post.find_or_create_by!(
    title: "My unique post title",
    body: "My unique post has a unique body!"
)

Comment.find_or_create_by!(
    post: myPost,
    body: "This seeding stuff is confusing me more than it should!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"