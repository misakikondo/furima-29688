class Comment < ApplicationRecord
 belongs_to :user, dependent: :destroy
 belongs_to :item, dependent: :destroy

 validates :text, presence: true
end
