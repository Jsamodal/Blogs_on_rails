class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user ,optional: true
end
