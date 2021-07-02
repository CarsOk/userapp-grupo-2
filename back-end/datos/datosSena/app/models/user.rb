class User < ApplicationRecord
   validates :name, :email, :year, presence: true
end
