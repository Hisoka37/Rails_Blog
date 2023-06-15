class User < ApplicationRecord
    has_many :post, class_name: 'Post', foreign_key: :author_id
    has_many :comments, class_name: : 'Comment', foreign_key: :author_id
    has_many :likes, class_name: : 'Like', foreign_key: :author_id

    def latest_posts
        post.order(created_at: :desc).limit(4)
    end
end
