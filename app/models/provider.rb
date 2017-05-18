class Provider < ActiveRecord::Base
  require 'csv'
  has_many  :events
  has_many   :notes,as: :notable
  has_many   :tags ,as: :tagable
  has_many :sites,through: :events
  has_paper_trail
  #has_paper_trail meta: { timestamp: Time.now }
  #has_paper_trail ignore: [:view_count]
  #has_many  :users
  default_scope { order(last_name: :asc) }
  
  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR preferred_name LIKE ?","#{search}","#{search}","#{search}")
    #where("first_name LIKE ?","#{search}")
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      provider_hash = row.to_hash # exclude the price field
      provider = Provider.where(id: provider_hash["id"])

      if provider.count == 1
        provider.first.update_attributes(provider_hash.except("access_id")) # exclude the price field.
      else
        Provider.create!(provider_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)


  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv.add_row column_names
      all.each do |provider|
        values=provider.attributes.values
        csv.add_row values
      end
    end
  end

  #address json field key value process
  def address
    read_attribute(:address).map {|v| Address.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
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
    v << Address.new({type: '', street: '',city: '',state: '',zip: ''})
    self.address = v
  end

  class Address
    attr_accessor :type, :street,:city,:state,:zip

    def initialize(hash)
      hash = hash.symbolize_keys
      @type          = hash[:type]
      @street    = hash[:street]
      @city    =hash[:city]
      @state = hash[:state]
      @zip  = hash[:zip]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #email json field key value process

  def email
    read_attribute(:email).map {|v| Email.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def email_attributes=(attributes)
    email = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      email << attrs
    end
    write_attribute(:email, email)
  end

  def build_email
    v = self.email.dup
    v << Email.new({type: '', email_address: ''})
    self.email = v
  end

  class Email
    attr_accessor :type, :email_address

    def initialize(hash)
      hash = hash.symbolize_keys
      @type          = hash[:type]
      @email_address    = hash[:email_address]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #phone number json field key value process

  def phone_number
    read_attribute(:phone_number).map {|v| Phone_number.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def phone_number_attributes=(attributes)
    phone_number = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      phone_number << attrs
    end
    write_attribute(:phone_number, phone_number)
  end

  def build_phone_number
    v = self.phone_number.dup
    v << Phone_number.new({type: '', number: '',carrier: ''})
    self.phone_number = v
  end

  class Phone_number
    attr_accessor :type, :number,:carrier

    def initialize(hash)
      hash = hash.symbolize_keys
      @type          = hash[:type]
      @number    = hash[:number]
      @carrier= hash[:carrier]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end
  #insurance json field key value process

  def insurance
    read_attribute(:insurance).map {|v| Insurance.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def insurance_attributes=(attributes)
    insurance = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      insurance << attrs
    end
    write_attribute(:insurance, insurance)
  end

  def build_insurance
    v = self.insurance.dup
    v << Insurance.new({carrier: '', coverage: '',policy_number: '',expiration: '',carrier_address: ''})
    self.insurance = v
  end

  class Insurance
    attr_accessor :carrier, :coverage,:policy_number,:expiration,:carrier_address

    def initialize(hash)
      hash = hash.symbolize_keys
      @carrier     = hash[:carrier]
      @coverage    = hash[:coverage]
      @policy_number    = hash[:policy_number]
      @expiration    = hash[:expiration]
      @carrier_address    = hash[:carrier_address]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #contract json field key value process

  def contract
    read_attribute(:contract).map {|v| Contract.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def contract_attributes=(attributes)
    contract = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      contract << attrs
    end
    write_attribute(:contract, contract)
  end

  def build_contract
    v = self.contract.dup
    v << Contract.new({begin_date: '', end_date: '',signed_date: '',url: ''})
    self.contract = v
  end

  class Contract
    attr_accessor :begin_date, :end_date,:signed_date,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @begin_date     = hash[:begin_date]
      @end_date    = hash[:end_date]
      @signed_date    = hash[:signed_date]
      @url    = hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #caqh json field key value process

  def caqh
    read_attribute(:caqh).map {|v| Caqh.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def caqh_attributes=(attributes)
    caqh = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      caqh << attrs
    end
    write_attribute(:caqh, caqh)
  end

  def build_caqh
    v = self.caqh.dup
    v << Caqh.new({password: '', login: ''})
    self.caqh = v
  end

  class Caqh
    attr_accessor :password, :login

    def initialize(hash)
      hash = hash.symbolize_keys
      @password     = hash[:password]
      @login    = hash[:login]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #atls json field key value process

  def atls
    read_attribute(:atls).map {|v| Atls.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def atls_attributes=(attributes)
    atls = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      atls << attrs
    end
    write_attribute(:atls, atls)
  end

  def build_atls
    v = self.atls.dup
    v << Atls.new({issue_date: '', expiration_date: '',state: '',url: ''})
    self.atls = v
  end

  class Atls
    attr_accessor :issue_date, :expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date     = hash[:issue_date]
      @expiration_date    = hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #acls json field key value process

  def acls
    read_attribute(:acls).map {|v| Acls.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def acls_attributes=(attributes)
    acls = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      acls << attrs
    end
    write_attribute(:acls, acls)
  end

  def build_acls
    v = self.acls.dup
    v << Acls.new({issue_date: '', expiration_date: '',state: '',url: ''})
    self.acls = v
  end

  class Acls
    attr_accessor :issue_date, :expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date     = hash[:issue_date]
      @expiration_date    = hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #pals json field key value process

  def pals
    read_attribute(:pals).map {|v| Pals.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def pals_attributes=(attributes)
    pals = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      pals << attrs
    end
    write_attribute(:pals, pals)
  end

  def build_pals
    v = self.pals.dup
    v << Pals.new({issue_date: '', expiration_date: '',state: '',url: ''})
    self.pals = v
  end

  class Pals
    attr_accessor :issue_date, :expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date     = hash[:issue_date]
      @expiration_date    = hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #also json field key value process

  def also
    read_attribute(:also).map {|v| Also.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def also_attributes=(attributes)
    also = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      also << attrs
    end
    write_attribute(:also, also)
  end

  def build_also
    v = self.also.dup
    v << Also.new({issue_date: '', expiration_date: '',state: '',url: ''})
    self.also = v
  end

  class Also
    attr_accessor :issue_date, :expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date     = hash[:issue_date]
      @expiration_date    = hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #nrp json field key value process

  def nrp
    read_attribute(:nrp).map {|v| Nrp.new(v) }
  end

  # ActionController params will come across as:
  # {"0"=>{"first"=>"foo", "second"=>"10"}}
  def nrp_attributes=(attributes)
    nrp = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      nrp << attrs
    end
    write_attribute(:nrp, nrp)
  end

  def build_nrp
    v = self.nrp.dup
    v << Nrp.new({issue_date: '', expiration_date: '',state: '',url: ''})
    self.nrp = v
  end

  class Nrp
    attr_accessor :issue_date, :expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date     = hash[:issue_date]
      @expiration_date    = hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #bls json field key value process


  def bls_attributes=(attributes)
    bls = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      bls << attrs
    end
    write_attribute(:bls, bls)
  end

  def build_bls
    v = self.bls.dup
    v << Bls.new({issue_date: '', expiration_date: '', state: '',url: ''})
    self.bls = v
  end

  def bls
    read_attribute(:bls).map {|v| Bls.new(v)}
  end

  class Bls
    attr_accessor :issue_date,:expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date=hash[:issue_date]
      @expiration_date=hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #state_licensure json field key value process

  def state_licensure_attributes=(attributes)
    state_licensure = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      state_licensure << attrs
    end
    write_attribute(:state_licensure, state_licensure)
  end

  def build_state_licensure
    v = self.state_licensure.dup
    v << State_licensure.new({issue_date: '', expiration_date: '', state: '',url: ''})
    self.state_licensure = v
  end

  def state_licensure
    read_attribute(:state_licensure).map {|v| State_licensure.new(v)}
  end

  class State_licensure
    attr_accessor :issue_date,:expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @issue_date=hash[:issue_date]
      @expiration_date=hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end


  #board_certification json field key value process

  def board_certification_attributes=(attributes)
    board_certification = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      board_certification << attrs
    end
    write_attribute(:board_certification, board_certification)
  end

  def build_board_certification
    v = self.board_certification.dup
    v << Board_certification.new({id: '',issue_date: '', expiration_date: '', state: '',url: ''})
    self.board_certification = v
  end

  def board_certification
    read_attribute(:board_certification).map {|v| Board_certification.new(v)}
  end

  class Board_certification
    attr_accessor :id, :issue_date,:expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @id=hash[:id]
      @issue_date=hash[:issue_date]
      @expiration_date=hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #dea json field key value process

  def dea_attributes=(attributes)
    dea = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      dea << attrs
    end
    write_attribute(:dea, dea)
  end

  def build_dea
    v = self.dea.dup
    v << Dea.new({id: '',issue_date: '', expiration_date: '', state: '',url: ''})
    self.dea = v
  end

  def dea
    read_attribute(:dea).map {|v| Dea.new(v)}
  end

  class Dea
    attr_accessor :id, :issue_date,:expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @id=hash[:id]
      @issue_date=hash[:issue_date]
      @expiration_date=hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #state_narcotic json field key value process
  def state_narcotic_attributes=(attributes)
    state_narcotic = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      state_narcotic << attrs
    end
    write_attribute(:state_narcotic, state_narcotic)
  end

  def build_state_narcotic
    v = self.state_narcotic.dup
    v << State_narcotic.new({id: '',issue_date: '', expiration_date: '', state: '',url: ''})
    self.state_narcotic = v
  end

  def state_narcotic
    read_attribute(:state_narcotic).map {|v| State_narcotic.new(v)}
  end

  class State_narcotic
    attr_accessor :id, :issue_date,:expiration_date,:state,:url

    def initialize(hash)
      hash = hash.symbolize_keys
      @id=hash[:id]
      @issue_date=hash[:issue_date]
      @expiration_date=hash[:expiration_date]
      @state=hash[:state]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end

  #privileges json field key value process
  def privileges_attributes=(attributes)
    privileges = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      privileges << attrs
    end
    write_attribute(:privileges, privileges)
  end

  def build_privileges
    v = self.state_narcotic.dup
    v << Privileges.new({title: '',url: ''})
    self.privileges = v
  end

  def privileges
    read_attribute(:privileges).map {|v| Privileges.new(v)}
  end

  class Privileges
    attr_accessor :title, :url

    def initialize(hash)
      hash = hash.symbolize_keys
      @title=hash[:title]
      @url=hash[:url]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end



  #residency json field key value process
  def residency_attributes=(attributes)
    residency = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      residency << attrs
    end
    write_attribute(:residency, residency)
  end

  def build_residency
    v = self.residency.dup
    v << Residency.new({name: '',address: '',focus: '',start_date: '',end_date: ''})
    self.residency = v
  end

  def residency
    read_attribute(:residency).map {|v| Residency.new(v)}
  end

  class Residency
    attr_accessor :name, :address,:focus,:start_date,:end_date

    def initialize(hash)
      hash = hash.symbolize_keys
      @name=hash[:name]
      @address=hash[:address]
      @focus=hash[:focus]
      @start_date=hash[:start_date]
      @end_date=hash[:end_date]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end



  #medical_education json field key value process
  def medical_education_attributes=(attributes)
    medical_education = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      medical_education << attrs
    end
    write_attribute(:medical_education, medical_education)
  end

  def build_medical_education
    v = self.medical_education.dup
    v << Medical_education.new({name: '',address: '',degree: '',dates: ''})
    self.medical_education = v
  end

  def medical_education
    read_attribute(:medical_education).map {|v| Medical_education.new(v)}
  end

  class Medical_education
    attr_accessor :name, :address,:degree,:dates

    def initialize(hash)
      hash = hash.symbolize_keys
      @name=hash[:name]
      @address=hash[:address]
      @degree=hash[:degree]
      @dates=hash[:dates]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end


  #medical_education json field key value process
  def pre_med_education_attributes=(attributes)
    pre_med_education = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      pre_med_education << attrs
    end
    write_attribute(:pre_med_education, pre_med_education)
  end

  def build_pre_med_education
    v = self.pre_med_education.dup
    v << Pre_med_education.new({name: '',address: '',degree: '',dates: ''})
    self.pre_med_education = v
  end

  def pre_med_education
    read_attribute(:pre_med_education).map {|v| Pre_med_education.new(v)}
  end

  class Pre_med_education
    attr_accessor :name, :address,:degree,:dates

    def initialize(hash)
      hash = hash.symbolize_keys
      @name=hash[:name]
      @address=hash[:address]
      @degree=hash[:degree]
      @dates=hash[:dates]
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end
  
  def self.empty_date(field)
    if field.nil? 
      field
    else
      field.to_date.strftime("%D")
    end
  end
  
end
