# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding'
Comment.destroy_all
Post.destroy_all
# Creating the post first
post = Post.create!(title: 'Test', description: 'Test Description')

# After that we create our parent comment
first_comment = Comment.create!(description: 'My comment', commentable: post)

# Using the parent comment we create the comment of a comment
comment_of_comment = Comment.create!(description: 'I`m a comment of a comment', commentable: post, parent_id: first_comment.id)

# Now we can nest another comment inside the comment_of_comment, and we can go on forever (I think the limit is 10k)
Comment.create!(description: 'Nested comment inside the Comment of a Comment', commentable: post, parent_id: comment_of_comment.id)
puts 'Finish Seeding'
