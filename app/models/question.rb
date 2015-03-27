class Question < ActiveRecord::Base
  has_many :answers,
    dependent: :destroy

  belongs_to :user

  validates :title,
    length: { minimum: 4 }

  validates :body,
    length: { minimum: 1 }
end
