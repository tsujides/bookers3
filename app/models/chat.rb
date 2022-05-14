class Chat < ApplicationRecord
  belongs_to :from, class_name: 'User', foreign_key: :from_id
  belongs_to :to, class_name: 'User', foreign_key: :to_id

  validates :message,presence:true,length:{maximum:140}
end
