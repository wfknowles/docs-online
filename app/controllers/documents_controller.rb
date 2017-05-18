class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    if params[:search]
      @documents = Document.search(params[:search]).order("created_at DESC")
    else
      @documents=Document.all.order("created_at DESC")
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to document_path(@document), notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update

    @document=Document.find_by_id(params[:id])
    if @document.update(document_params)
      redirect_to document_path(@document), notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  def undo
    @document_version = PaperTrail::Version.find_by_id(params[:id])

    begin
      if @document_version.reify
        @document_version.reify.save
      else
        # For undoing the create action
        @document_version.item.destroy
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
  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def make_undo_link
      view_context.link_to 'Undo that plz!', undo_path(@document.versions.last), method: :document
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :creator, :typed)
    end
end
