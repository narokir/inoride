class StaticPagesController < ApplicationController
  
  def home
    @rides = Ride.all(limit: 3)
  end

  def help
  end
  
  def about
    
  end
  
  def contac
  end
  
  def signup
  end
  
  def signin
    if session[:user_id].present?
      respond_to do |format|
        format.html { redirect_to new_ride_path, notice: 'Hey there' }
        format.json { render json: @ride }
      end
    end
  end


end
