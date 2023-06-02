class User < ApplicationRecord
  require "securerandom"
  has_secure_password

  validates :email,presence: true, uniqueness: true
  validates :password,presence: true, length: {minimum: 6}
  validates  :cc,uniqueness: true
  self.inheritance_column = :_type_disabled
  has_one :admin, dependent: :destroy
  has_one :graduate, dependent: :destroy
  has_one :student, dependent: :destroy
end
