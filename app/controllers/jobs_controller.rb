class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @version = PaperTrail::Version.order('created_at ASC').last
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
    if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      #redirect_to @provider,
    else
      format.html { render :new }
      format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  def undo
    @job_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @job_version.reify
        @job_version.reify.save
      else
        # For undoing the create action
        @job_version.item.destroy
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

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job=Job.find_by_id(params[:id])
    respond_to do |format|
      if @job.update(job_params)
      format.html { redirect_to @job, notice: 'Job was successfully updated.' }
      format.json { render :show, status: :ok, location: @job }
      # flash[:success] = "Provider was successfully updated."
      #redirect_to provider_path(@provider)
      #redirect_to @provider, notice: 'Provider was successfully updated.'
      else
      format.html { render :edit }
      format.json { render json: @job.errors, status: :unprocessable_entity }
      end
      #render :edit
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    #redirect_to providers_url, notice: 'Provider was successfully destroyed.'

    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@job.versions.last), method: :job
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:action, :report, :display, :document, :category)
    end
end
