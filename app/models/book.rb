class Book < ApplicationRecord

    belongs_to :user
    belongs_to :bookshelf

    has_many :reviews

    

end
