class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  @flag=1
  def index
    @events = Event.where(start: params[:start]..params[:end])
    @events_xlsx=Event.all
    @representation = params[:representation]
    if( @representation != nil)
      @addcolumns = @representation.split(",")
    end

  if @flag==2
    respond_to do |format|
      format.iif { render iif: render_to_string, filename: 'shift'}
       format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_shifts.xlsx"'
      }

      format.csv do
        headers['Content-Disposition']="attachment; filename=\"shift-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
  end


  def note
    @note = Note.new
    @mid=params[:mid]
  end

  def show
    @notes=Note.where(:notable_type=>"Event")
    @event=Event.find_by_id(params[:id])
    @provider_field=Provider.where(:id=>@event.provider_id)
    puts "jkhjdkshfjkdfj"
    puts @provider_field
    @site_field=Site.where(:id=>@event.site_id)
    @version = PaperTrail::Version.where(:item_type=>"Event").where(:item_id=>@event.id).last
    @mid=params[:id]
  end

  def new
    @event = Event.new
    @providers=Provider.all
    @sites=Site.all
  end

  def import
    begin
      Event.import(params[:file])
      redirect_to events_path, notice: "Products imported."
    rescue
      redirect_to events_path, notice: "Invalid CSV file format."
    end
  end
  
  def edit
    @event=Event.find(params[:id])
    @providers=Provider.all
    @sites=Site.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @providers=Provider.all
    @sites=Site.all
  end

  def update
    @event.update(event_params)
    @providers=Provider.all
    @sites=Site.all
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:provider_id,:site_id,:title, :date_range, :start, :end,:status,:hide_from_schedule,:custom_pay_rate,:custom_bill_rate,:area,:filled_on, :color)
    end
end
