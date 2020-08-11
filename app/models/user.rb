class User < ApplicationRecord
    has_many :purchases
    has_many :plants, through: :purchases
end
