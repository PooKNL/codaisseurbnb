class Theme < ApplicationRecord
  has_and_belongs_to_many :rooms, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
