class Sticky < ApplicationRecord
  has_paper_trail

  def self.search(search)
    where("author LIKE ?","%#{search}%")
  end
end
