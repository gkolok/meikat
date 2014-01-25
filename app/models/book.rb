class Book < ActiveRecord::Base
    has_many :lendings, dependent: :destroy
end
