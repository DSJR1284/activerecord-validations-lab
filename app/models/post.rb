require "pry"
class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with PostValidator

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction or Non-Fiction) }
    validate :clickbait?
    
    def clickbait?
        unless title && title.match(/Won't Believe |Secret|Top [0-9]+|Guess/)
            errors[:title] << "Not Click Bait"
        end 
    end 
end



