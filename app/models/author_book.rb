class AuthorBook < ApplicationRecord
  belongs_to :book
  belongs_to :author

  validates_presence_of :name,
                        :title,
                        :pages,
                        :year,
                        :author

end
