class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :title,
    length: { minimum: 4 }

  validates :body,
    length: { minimum: 15 }
end
