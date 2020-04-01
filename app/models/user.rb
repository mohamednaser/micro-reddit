class User < ApplicationRecord
    validates :name,  presence: true, length: { minimum: 3 ,  maximum: 150}
    validates :email,  presence: true, length: { minimum: 3 ,  maximum: 150}

    has_many :posts, class_name: "Post"
    has_many :comments, class_name: "Comment"

end
