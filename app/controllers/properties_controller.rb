class PropertiesController < ApplicationController
  def new
    @property = Property.new
    2.times do |n|
      @property.stations.build
    end
  end

  def create
    @property = Property.new(property_params)
    if @property.save 
      redirect_to properties_path,nocite:"完了"
    else
      render 'new'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path,notice:"編集完了しました"
    else
      render 'edit'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path,notice:"削除しました"
  end

  def index
    @properties = Property.all
  end

  private
    def property_params
      params.require(:property).permit(
        :name,
        :rent,
        :address,
        :age,
        :remark,
        stations_attributes:[
          :route,
          :name,
          :walking_minute,
          :id
        ]
      )
    end
end
