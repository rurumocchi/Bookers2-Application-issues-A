class Book < ApplicationRecord
  is_impressionable

  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :rate, presence: true, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def Book.book_search(keyword)
    Book.where("category LIKE?", "%#{keyword}%")
  end

end
