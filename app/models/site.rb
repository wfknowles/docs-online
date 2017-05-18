class Site < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  has_many  :events
  has_many   :notes,as: :notable
  has_many   :tags ,as: :tagable
  has_many :providers, through: :events
  def self.search(search)
    where("hospital_name LIKE ?","%#{search}%")
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      site_hash = row.to_hash # exclude the price field
      site = Site.where(id: site_hash["id"])

      if site.count == 1
        site.first.update_attributes(site_hash.except("access_id")) # exclude the price field.
      else
        Site.create!(site_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)

  
   def billing_shifts
    read_attribute(:shifts).map {|v| Shifts.new(v)}
  end

  def billing_shifts_attributes=(attributes)
    shifts = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      shifts << attrs
    end
    write_attribute(:shifts, shifts)
  end

  def build_shifts
    v = self.shifts.dup
    v << Shifts.new({type: '',content: ''})
    self.shifts = v
  end



  class Shifts
    attr_accessor :type,:content

    def initialize(hash)
      hash = hash.symbolize_keys
      @type=hash[:type]
      @content=hash[:content]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end



  def billing_address
    read_attribute(:billing_address).map {|v| Billing_address.new(v)}
  end

  def billing_address_attributes=(attributes)
    billing_address = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      billing_address << attrs
    end
    write_attribute(:billing_address, billing_address)
  end

  def build_billing_address
    v = self.billing_address.dup
    v << Billing_address.new({street: '',city: '',state: '',zip: ''})
    self.billing_address = v
  end



  class Billing_address
    attr_accessor :street,:city,:state,:zip

    def initialize(hash)
      hash = hash.symbolize_keys
      @street=hash[:street]
      @city=hash[:city]
      @state=hash[:state]
      @zip=hash[:zip]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end






  def address
    read_attribute(:address).map {|v| Address.new(v)}
  end

  def address_attributes=(attributes)
    address = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      address << attrs
    end
    write_attribute(:address, address)
  end

  def build_address
    v = self.address.dup
    v << Address.new({type: '',street: '',city: '',state: '',zip: ''})
    self.address = v
  end



  class Address
    attr_accessor :type,:street,:city,:state,:zip

    def initialize(hash)
      hash = hash.symbolize_keys
      @type=hash[:type]
      @street=hash[:street]
      @city=hash[:city]
      @state=hash[:state]
      @zip=hash[:zip]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end




  def contacts
    read_attribute(:contacts).map {|v| Contacts.new(v)}
  end

  def contacts_attributes=(attributes)
    contacts = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      contacts << attrs
    end
    write_attribute(:contacts, contacts)
  end

  def build_contacts
    v = self.contacts.dup
    v << Contacts.new({name: '',description: '',phone_number: '',email: ''})
    self.contacts = v
  end



  class Contacts
    attr_accessor :name,:description,:phone_number,:email

    def initialize(hash)
      hash = hash.symbolize_keys
      @name=hash[:name]
      @description=hash[:description]
      @phone_number=hash[:phone_number]
      @email=hash[:email]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  def housing_info
    read_attribute(:housing_info).map {|v| Housing_info.new(v)}
  end

  def housing_info_attributes=(attributes)
    housing_info = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      housing_info << attrs
    end
    write_attribute(:housing_info, housing_info)
  end

  def build_housing_info
    v = self.housing_info.dup
    v << Housing_info.new({housing_skill: '',housing_time: ''})
    self.housing_info = v
  end



  class Housing_info
    attr_accessor :housing_skill,:housing_time

    def initialize(hash)
      hash = hash.symbolize_keys
      @housing_skill=hash[:housing_skill]
      @housing_time=hash[:housing_time]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end
end
