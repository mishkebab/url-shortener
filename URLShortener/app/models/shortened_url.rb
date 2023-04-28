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
