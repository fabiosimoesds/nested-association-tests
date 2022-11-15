class Comment < ApplicationRecord
  # Here we create a Polymorphic association so the model can belong to more than one other model
  # on a single association, so we can create other models that have comments a part from Post.rb,
  # for example Discussion.rb. So Comment.rb would also be reausable for the Discussion.rb
  belongs_to :commentable, polymorphic: true

  # Now we are creating the association with the parent comment. Works like a Threads on redit.
  # This is called a Self Join association
  belongs_to :parent, optional: true, class_name: "Comment"
end
