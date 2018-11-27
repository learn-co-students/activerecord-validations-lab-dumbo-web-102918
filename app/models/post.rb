class Post < ActiveRecord::Base
  REQUIRED_KEYWORD_IN_TITLE = %w(Won't Believe Secret Top[number] Guess)
  validates_presence_of :title
  validate :title_must_include
  # validates :title, presence: true, title: true
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion:{in: %w(Fiction Non-Fiction)}

  private
  def title_must_include
    if title
      if !(REQUIRED_KEYWORD_IN_TITLE & title.split).any?
        errors.add(:title, "is missing one of the required keywords")
      end
    end
  end
end
