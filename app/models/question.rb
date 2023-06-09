class Question < ApplicationRecord
    belongs_to :category
    belongs_to :user

    has_one_attached :file

    include Authorship
end
