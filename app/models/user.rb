class User < ActiveRecord::Base
    has_many :guardians
    has_many :items, through: :guardian
end