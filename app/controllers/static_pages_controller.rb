class StaticPagesController < ApplicationController
  def home
    @ride = Ride.all(limit: 4)
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
<<<<<<< Updated upstream
        format.json { render json: @ride }
      end
=======
        #format.json { render json: @ride }
      end
      #redirect_to new_ride_path
>>>>>>> Stashed changes
    end
  end
  
end
