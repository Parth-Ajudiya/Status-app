class Status < ApplicationRecord
    belongs_to :user
    validates :select_date, presence: true
    validates :tasks , presence: true
    validates :prlinks, presence: true
    validates :hours, presence: true, numericality: true, length: { maximum: 1}
end
