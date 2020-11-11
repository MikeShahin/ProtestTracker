class User < ActiveRecord::Base
    has_secure_password
    has_many :protests
    # begin
    # validates :username, :presence => true, :uniqueness => true
    # rescue
    #         flash[:error] = "Sorry, this name is already taken, please choose a different one"
    #   redirect to '/signup'
    # end
    def slug
        username.downcase.gsub(" ","-")
      end
  
    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end
end
