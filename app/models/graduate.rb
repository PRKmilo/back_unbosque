class Graduate < ApplicationRecord
  belongs_to :user
  has_many :works
  has_many :life_histories
  has_many :academic_titles
end
