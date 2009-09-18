class Admin::ImagesController < Admin::ApplicationController

  def index
    @car.find(params[:car])
    @images = @car.images
  end

  def new
    @car = Car.find(params[:car_id])
    @image = Image.new
  end

 def create
    @car = Car.find(params[:car_id])
    @image = @car.images.new(params[:image])
    respond_to do |format|
      if @image.save
        format.html { redirect_to([:admin,@car,@images], :params => @car.id) }
       else
        format.html { render :action => "show" }
      end
    end
  end

  def edit
    @car = Car.find(params[:car_id])
    @image = Image.find(params[:id])
  end

  def update
    @car = Car.find(params[:car_id])
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to([:admin,@car,@images], :params => @car.id) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

	def destroy
	  @car = Car.find(params[:car_id])
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
       format.html { redirect_to([:admin,@car,@images], :params => @car.id) }
    end
  end

end

