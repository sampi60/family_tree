class User < ApplicationRecord
  validates_presence_of :email, :type
  validates_uniqueness_of :email
end
