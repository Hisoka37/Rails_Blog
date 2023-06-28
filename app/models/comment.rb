class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  attribute :text, :text
  after_create :update_post_comments_counter
  after_save :update_comments_counter
  after_destroy :update_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
