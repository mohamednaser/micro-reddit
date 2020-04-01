class Post < ApplicationRecord
    validates :title,  presence: true, length: { minimum: 3 ,  maximum: 150}
    validates :details,  presence: true, length: { minimum: 15 ,  maximum: 150}
    
    belongs_to :user
end
