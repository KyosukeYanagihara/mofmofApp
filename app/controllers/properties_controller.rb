class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
    @stations = @property.stations
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end 

  def edit
    @property.stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を登録しました！"
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(
      :name, 
      :rent, 
      :address, 
      :age, 
      :other,
    stations_attributes: [
      :route_name,
      :station_name,
      :access,
      :property_id,
      :id,
      :_destroy,
    ],
    )
  end
end
