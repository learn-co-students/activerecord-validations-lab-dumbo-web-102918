class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait
    def clickbait
      if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess"))
        errors.add(:clickbait, "You expect someone to click on this?")
      end
    end
end
