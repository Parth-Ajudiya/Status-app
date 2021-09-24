class User < ApplicationRecord
    has_many :statuses, dependent: :destroy
 accepts_nested_attributes_for :statuses
end
