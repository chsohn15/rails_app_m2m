class Plant < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases
    belongs_to :store, optional: true

    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
