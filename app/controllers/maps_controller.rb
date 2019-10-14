class MapsController < ApplicationController
  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
    @json = Map.all.to_gmaps4rails


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maps }
    end
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    #@map = Map.find(params[:id])
    #@json = Map.all.to_gmaps4rails
    #@markers = Map.all.to_gmaps4rails
    #@markers = Map.find(params[:id]).to_gmaps4rails
    #@json = Map.find.(params[:id]).to_gmaps4rails
    @map = Map.find(params[:id])
    @json = Map.find(params[:id]).to_gmaps4rails

    
  end

  # GET /maps/new
  # GET /maps/new.json
  def new
    @map = Map.new
    @json = Map.new.to_gmaps4rails
    @markers = Map.new.to_gmaps4rails

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
    #@json = Map.find(params[:id])
    @markers = Map.find(params[:id])
    @json = Map.find(params[:id]).to_gmaps4rails
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(params[:map])
    @json = Map.new.to_gmaps4rails

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render json: @map, status: :created, location: @map }
      else
        format.html { render action: "new" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maps/1
  # PUT /maps/1.json
  def update
    @map = Map.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end
end