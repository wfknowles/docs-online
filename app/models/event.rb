class Event < ApplicationRecord
  has_paper_trail
  belongs_to :provider
  belongs_to :site
  has_many   :notes,as: :notable
  validates :title, presence: true
  attr_accessor :date_range


  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      event_hash = row.to_hash # exclude the price field
      event = Event.where(id: event_hash["id"])

      if event.count == 1
        event.first.update_attributes(event_hash.except("access_id")) # exclude the price field.
      else
        Event.create!(event_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)


  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv.add_row column_names
      all.each do |event|
        values=event.attributes.values
        csv.add_row values
      end
    end
  end
end
