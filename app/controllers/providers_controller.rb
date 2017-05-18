class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  def index
    #@providers=Provider.all
    if params[:search]
      @providers = Provider.search(params[:search]).order("last_name ASC")
    else
      @providers=Provider.all.order("last_name ASC")
    end


    @representation = params[:representation]
    if( @representation != nil)
      @addcolumns = @representation.split(",")
    end

    @filter_field = params[:filter_field]
    if( @filter_field != nil)
      @field_columns = @filter_field.split(",")
    end

    @operator = params[:operator]
    if( @operator != nil)
      @operator_columns = @operator.split(",")
    end

    @first_val = params[:first_val]
    if( @first_val != nil)
      @firstval_columns = @first_val.split(",")
    end

    @second_val = params[:second_val]
    if( @second_val != nil)
      @secondval_columns = @second_val.split(",")
    end

    #perform the advanced filter using where clause
    @sql_array=Array[]
    @sql_query=""
    if( @field_columns!=nil)
      @field_columns.each do |field|
        print Provider.columns_hash[field].type
        #if Provider.columns_hash[field].type==:
      end
    end

    if(@firstval_columns!=nil)
      @firstval_columns.each do |firstval|
        @sql_array.push(firstval)
      end
    end
    #@providers_export=Provider.where(@sql_array)


    respond_to do |format|
      format.iif { render iif: render_to_string, filename: 'provider'}
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="providers.xlsx"'
      }

      format.csv do
        headers['Content-Disposition']="attachment; filename=\"provider-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end

    end

  end



  def export
    @data = Provider.order(:created_at)
    respond_to do |format|
      format.html{redirect_to root_url}
      format.csv {send_data @data.to_csv}
    end
  end

  # GET /providers/1
  def show
    @provider=Provider.find_by_id(params[:id])
    @notes=Note.where(:notable_type=>"Provider").where(:notable_id=>@provider.id).limit(10)
    @version = PaperTrail::Version.where(:item_type=>"Provider").where(:item_id=>@provider.id).last
    @mid=params[:id]
  end

  def import
    begin
      Provider.import(params[:file])
      redirect_to providers_path, notice: "Providers imported."
    rescue
      redirect_to providers_path, notice: "Invalid CSV file format."
    end
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @note = Note.new
    @mid=params[:mid]
    #json type field handle
    @provider.build_email
    @provider.build_address
    @provider.build_phone_number
    @provider.build_insurance
    @provider.build_contract
    @provider.build_caqh
    @provider.build_atls
    @provider.build_acls
    @provider.build_pals
    @provider.build_also
    @provider.build_nrp
    @provider.build_bls
    @provider.build_state_licensure
    @provider.build_board_certification
    @provider.build_dea
    @provider.build_state_narcotic
    @provider.build_privileges
    @provider.build_residency
    @provider.build_medical_education
    @provider.build_pre_med_education

  end

  # GET /providers/1/edi
  def edit
  end

  # POST /providers
  def create
    print "dfkljkdf"
    @provider = Provider.new(provider_params)
    print @provider.acls
    if @provider.save
      @user = User.new(:email =>@provider.email, :password => "111111", :password_confirmation => "111111")
      @user.save
      redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render :new
    end
  end

  def undo
    @provider_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @provider_version.reify
        @provider_version.reify.save
      else
        # For undoing the create action
        @provider_version.item.destroy
      end
      flash[:success] = "Undid that! #{make_redo_link}"
    rescue
      flash[:alert] = "Failed undoing the action..."
    ensure
      redirect_to root_path
    end
  end

  def history
    @versions = PaperTrail::Version.order('created_at DESC')
  end

  # PATCH/PUT /providers/1
  def update
    @provider=Provider.find_by_id(params[:id])
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.'#
    else
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@provider.versions.last), method: :provider
  end
  # Only allow a trusted parameter "white list" through.
  def provider_params
    #params.require(:provider).permit(:id,:rails,:last_name, :first_name, :preferred_name, :middle_name, :salutation,:status, :ssn, :birth_date, :gender, :spouse_name, :birth_place,  :superviser,  :hire_date, :termination_date,:provider_type,:provider_skills,:misc_info,:ecfmg,:medicare,:medicaid,:npi,:staff_contact,:initial_contact_date,  :application_received_date, :cv_received_date, :interview_date, :date_verification, :verification_completion_date,  :recertification_request_date, :recertification_completion_date,  :active_referral_options,  :date_hired, :referred_by, :first_shift_date, :referral_paid_date, :amount, :notepad, :referral_code,  :access_id, :microstaffer_id,:address,:email, :phone_number,:insurance,:contract,:caqh,:atls ,:acls ,:pals,:also,:nrp,:bls,:state_licensure,:board_certification,:dea,:state_narcotic,:privileges,:residency,:medical_education,:pre_med_education)
     params.require(:provider).permit(:id,:rails,:last_name, :first_name, :preferred_name, :middle_name, :salutation,:status, :ssn, :birth_date, :gender, :spouse_name, :birth_place,  :superviser,  :hire_date, :termination_date,:provider_type,:provider_skills,:misc_info,:ecfmg,:medicare,:medicaid,:npi,:staff_contact,:initial_contact_date,  :application_received_date, :cv_received_date, :interview_date, :date_verification, :verification_completion_date,  :recertification_request_date, :recertification_completion_date,  :active_referral_options,  :date_hired, :referred_by, :first_shift_date, :referral_paid_date, :amount, :notepad, :referral_code,  :access_id, :microstaffer_id,address_attributes: [:type,:street,:city,:state,:zip, :_destroy],email_attributes: [:type,:email_address, :_destroy], phone_number_attributes: [:type,:number,:carrier, :_destroy],insurance_attributes: [:carrier,:coverage,:policy_number,:expiration,:carrier_address, :_destroy],contract_attributes: [:begin_date,:end_date,:signed_date,:url, :_destroy],caqh_attributes: [:password,:login, :_destroy],atls_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],acls_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],pals_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],also_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],nrp_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],bls_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],state_licensure_attributes: [:issue_date,:expiration_date,:state,:url, :_destroy],board_certification_attributes: [:id,:issue_date,:expiration_date,:state,:url, :_destroy],dea_attributes: [:id,:issue_date,:expiration_date,:state,:url, :_destroy],state_narcotic_attributes: [:id,:issue_date,:expiration_date,:state,:url, :_destroy],privileges_attributes: [:title,:url, :_destroy],residency_attributes: [:name,:address,:focus,:start_date,:end_date, :_destroy],medical_education_attributes: [:name,:address,:degree,:dates, :_destroy],pre_med_education_attributes: [:name,:address,:degree,:dates,:pre_med_education_date, :_destroy])
  end
end