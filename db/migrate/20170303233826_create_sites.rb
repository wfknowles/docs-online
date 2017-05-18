class CreateSites < ActiveRecord::Migration
  def self.up
    if table_exists?(:sites)
    else
      enable_extension 'uuid-ossp' # => http://theworkaround.com/2015/06/12/using-uuids-in-rails.html#postgresql
      create_table :sites  do |t|
        t.uuid :site_id, null: false, default: 'uuid_generate_v4()'
        t.string   :hospital_name,              limit: 64
        t.json   :address,                      default: []
        t.json   :shifts,                       default: []
        t.string   :city                       ,limit: 64
        t.text   :phone_number                 ,limit: 65535
        t.text   :fax_number                   ,limit: 65535
        t.text   :po_box                       ,limit: 65535
        t.json   :contacts,                     default: []
        t.text     :certification_requirements, limit: 65535
        t.text     :notepad,                    limit: 65535
        t.text     :misc_info,                  limit: 65535
        t.json   :housing_info,                 default: []
        t.string   :status_options,             limit: 32
        t.string   :dwc_contact_staff           ,limit: 64
        t.string   :affiliation                 ,limit: 64
        t.json   :billing_address             ,default: []
        t.string  :access_id                      ,limit: 64
        t.string  :microstaffer_id                ,limit: 64
        t.timestamps null: false
      end
    end
    def self.down
     drop_table :sites
    end
  end
end