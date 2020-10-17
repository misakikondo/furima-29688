class Comment < ApplicationRecord
 belongs_to :user
 belongs_to :item

 validates :text, presence: true
 validate :no_4_bytes

def no_4_bytes
  if text.present?
    chars = text.each_char.select{|c| c.bytes.count >= 4}
    if chars.size > 0
        errors.add(:text, "に絵文字(#{chars.join('')})は使用できません。")
    end
  end
end
end
