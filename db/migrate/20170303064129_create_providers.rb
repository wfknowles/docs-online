class CreateProviders < ActiveRecord::Migration
  def up
    if table_exists?(:providers)
    else
      enable_extension 'uuid-ossp' # => http://theworkaround.com/2015/06/12/using-uuids-in-rails.html#postgresql
      create_table :providers do |t|
        t.uuid :provider_id, null: false, default: 'uuid_generate_v4()'
        t.string :last_name ,limit:32
        t.string :first_name ,limit:32
        t.string :preferred_name ,limit:32
        t.string :middle_name ,limit:32
        t.string :salutation ,limit:32
        t.json :address,     default: []
        t.json :email,       default: []
        t.json :phone_number, default: []
        t.string :status  ,limit: 64
        t.integer :ssn
        t.datetime   :birth_date
        t.string :gender ,limit: 16
        t.string :spouse_name  ,limit:32
        t.string :birth_place   ,limit:32
        t.string :superviser  ,limit:32
        t.datetime :hire_date
        t.datetime :termination_date
        t.string   :provider_type,                   limit: 32
        t.string   :provider_skills,                  limit: 64
        t.text     :misc_info
        t.json     :insurance,                       default: []
        t.json     :contract,                        default: []
        t.string   :ecfmg,                           limit: 32
        t.string   :medicare,                        limit: 32
        t.string   :medicaid,                        limit: 32
        t.string   :npi,                             limit: 32
        t.json     :caqh,                            default: []
        t.json     :atls,                            default: []
        t.json     :acls,                            default: []
        t.json     :pals,                            default: []
        t.json     :also,                            default: []
        t.json     :nrp,                             default: []
        t.json     :bls,                             default: []
        t.json     :state_licensure,                 default: []
        t.json     :board_certification,             default: []
        t.json      :dea,                            default: []
        t.json      :state_narcotic,                 default: []
        t.string    :staff_contact,                  limit: 64
        t.json      :privileges,                     default: []
        t.json :residency,                     default: []
        t.json :medical_education,             default: []
        t.json :pre_med_education,             default: []
        t.datetime :initial_contact_date
        t.datetime :application_received_date
        t.datetime :cv_received_date
        t.datetime :interview_date
        t.datetime :date_verification
        t.datetime :verification_completion_date
        t.datetime :recertification_request_date
        t.datetime :recertification_completion_date
        t.string :active_referral_options  ,limit:32
        t.datetime :date_hired
        t.string :referred_by  ,limit:32
        t.datetime :first_shift_date
        t.datetime :referral_paid_date
        t.float :amount
        t.text :notepad
        t.string :referral_code              ,limit: 64
        t.string :access_id                 ,limit: 64
        t.string :microstaffer_id           ,limit:64
        t.timestamps null: false
      end
    end
    def down
    end
  end
 end

