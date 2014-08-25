class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :content, presence: true, length: { minimum: 1 }

end
