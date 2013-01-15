class RidesController < ApplicationController
  before_filter	:signed_in_user, only: [:destroy,:create, :new]
  before_filter	:correct_user,	 only: [:edit, :destroy]
  #before_filter	:admin_user,	 only: [:edit, :destroy, :show]
  
  # GET /rides
  # GET /rides.json	
  def index
    @rides = Ride.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @ride = Ride.find(params[:id])
    #@rides = @user.rides.create(params[:user_id])
    @user = @ride.user(params[:id])
    @json = Ride.find(params[:id]).to_gmaps4rails
  end

  # GET /rides/new
  # GET /rides/new.json
  def new
      @ride = Ride.new
      @user = @ride.build_user(params[:user])
      @markers = '[
             {"description": "Origin",
              "lng": "-71.0597732",
              "lat": "42.3584308",
              "picture": "http://localhost:3000/assets/map_marker_green.png",
              "width": "55",
              "height": "41"
              },]'
      @json = @markers
  end

  # GET /rides/1/edit
  def edit
    @ride = Ride.find(params[:id])
  end

  # POST /rides
  # POST /rides.json
  def create
    if @ride.save
      flash[:success] = "Nice! Ride Created."
      redirect_to @ride
    else
      render action: "new"
      @feed_items = []
    end
  end

  # PUT /rides/1
  # PUT /rides/1.json
  def update
    @ride = Ride.find(params[:id])
    respond_to do |format|
      if @ride.update_attributes(params[:ride])
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    flash[:success] = "Ride was deleted!"
    redirect_to current_user
  end
  
  private

    def correct_user
      @ride = current_user.rides.find_by_id(params[:id])
      redirect_to root_url if @ride.nil?
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
