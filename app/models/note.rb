class Note < ApplicationRecord
  has_paper_trail
  belongs_to :notable,polymorphic: true
  def self.search(search)
    where("author LIKE ?","%#{search}%")
  end
end
