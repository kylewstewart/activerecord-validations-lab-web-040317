class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"]}
  validate :clickbait_y


  def clickbait_y
    if title
      clickbait = ["Won't Believe", "Secret", /(T|t)op[\d]+/, "Guess"]
      # binding.pry
      if !clickbait.collect {|click| title.match(click) == nil ? false : true }.include?(true)
        errors.add(:title, "must be clickbait")
      end
    end

  end

  binding.pry


end
