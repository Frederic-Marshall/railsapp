class Category < ApplicationRecord
    has_many :questions
    has_ancestry
    validates :name, presence: true, uniqueness: true
end
