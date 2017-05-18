class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    if Report.exists?
    else
     flash[:notice] = "There are  no records in report table."
    end
    @arrayList=params[:total_changes];
    @filterList=params[:filterlist];
    @operatorList=params[:operatorlist];
    @firstvalList=params[:firstvallist];
    @secondvalList=params[:secondvallist];
    if params[:search]
      @reports = Report.search(params[:search]).order("created_at DESC")
    else
      @reports=Report.all.order("created_at DESC")
    end

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    begin
      # do something dodgy
      @report=Report.find_by_id(@report.id)

      @module=@report.module
      if @module=="Provider"
        if Provider.exists?
        else
          flash[:notice] = "There are either no records for the selected module."
        end
      end

      if @module=="Site"
        if Site.exists?
        else
          flash[:notice] = "There are either no records for the selected module."
        end
      end

      if @module=="Shift"
        if Event.exists?
        else
          flash[:notice] = "There are either no records for the selected module."
        end
      end
        #@version = PaperTrail::Version.where(:item_type=>"Report").where(:item_id=>@report.id).last

    rescue ActiveRecord::RecordNotFound
      flash[:notice]="The RecordNotFount Error happens."
      # handle not found error
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
      flash[:notice]="The Active Record Error happens."
    rescue # StandardError
      # handle most other errors
      flash[:notice]="The Standard Error happens."
    rescue Exception
      # handle everything else
      flash[:notice]="The Everything Error happens."
    end
  end

  # GET /reports/new
  def new
    @report = Report.new
    @modeltable=Modeltable.all
    @arrayList=params[:total_changes];
    @filterList=params[:filterlist];
    @operatorList=params[:operatorlist];
    @firstvalList=params[:firstvallist];
    @secondvalList=params[:secondvallist];
    @originlist=params[:originlist];
  end

  # GET /reports/1/edit
  def edit
    @modeltable=Modeltable.all
    @report=Report.find(params[:id])
    @representation_array=@report.representation.split(",")

  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end


  def new_export
    respond_to do |format|
      format.html
      format.js
    end
  end
  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update

      @report=Report.find_by_id(params[:id])
      @modeltable=Modeltable.all
      if @report.update(report_params)
        redirect_to @report, notice: 'Report was successfully updated.'
      else
        render :edit
      end
  end

  def undo
    @report_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @report_version.reify
        @report_version.reify.save
      else
        # For undoing the create action
        @report_version.item.destroy
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
  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Provider was successfully destroyed.'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end


  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@report.versions.last), method: :report
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:id,:name, :creator, :typed,:module ,:representation,:filter_field,:operator,:first_val,:second_val)
    end
end
