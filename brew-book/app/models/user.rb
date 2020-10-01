class User < ActiveRecord::Base
has_secure_password
has_many :beers
validates :username, presence: :true
validates :username, uniqueness: :true
end