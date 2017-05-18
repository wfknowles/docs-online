class Document < ApplicationRecord
  has_paper_trail
  def self.search(search)
    where("name LIKE ?","%#{search}%")
  end
end
