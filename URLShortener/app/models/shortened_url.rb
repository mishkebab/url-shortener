# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, :user_id, presence: true

    after_initialize do |short_url|
        generate_short_url
        puts "you have shortened a url"
    end 

    def self.random_code
        random_code = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(random_code)
            random_code = SecureRandom.urlsafe_base64
        end
        random_code
    end 

    private 
    
    def generate_short_url
        if !short_url
            short_url = ShortenedUrl.random_code
        end
    end 
end


