class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /stickies
  # GET /stickies.json
  def index
    @notes = Note.all
    if params[:search]
      @notes = Note.search(params[:search]).order("created_at DESC")
    else
      @notes=Note.all.order("created_at DESC")
    end
  end

  # GET /stickies/1
  # GET /stickies/1.json
  def show
   @version = PaperTrail::Version.where(:item_type=>"Note").where(:item_id=>@note.id).last
  end

  # GET /stickies/new
  def new
    @note = Note.new
  end

  # GET /stickies/1/edit
  def edit
  end

  # POST /stickies
  # POST /stickies.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Sticky was successfully created.' }
        format.json { render :show, status: :created, location: @sticky }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stickies/1
  # PATCH/PUT /stickies/1.json
  def update
    respond_to do |format|
      if @note.update(sticky_params)
        format.html { redirect_to @note, notice: 'Sticky was successfully updated.' }
        format.json { render :show, status: :ok, location: @sticky }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stickies/1
  # DELETE /stickies/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Sticky was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:note, :author, :category, :timestamp, :hide_sticky,:notable_id,:notable_type)
  end
end
