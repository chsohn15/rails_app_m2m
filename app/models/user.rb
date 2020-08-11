class User < ApplicationRecord
    has_many :purchases
    has_many :plants, through: :purchases
    validates :name, presence: true, uniqueness:{case_sensitive:false}
end
