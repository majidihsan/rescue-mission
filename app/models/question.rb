class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 150 }, presence: true
end
