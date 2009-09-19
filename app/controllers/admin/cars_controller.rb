class Admin::CarsController < Admin::ApplicationController

  #before_filter :require_user

  def index
    @cars = Car.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cars }
    end
  end


  def show
    @car = Car.find(params[:id])
    #@image = @car.images
    #@image = Image.find_by_sql(["Select * From images where imageble_type = 'car' and imageble_id = ?", @car])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @car }
    end
  end

  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @car }
    end
  end


  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        flash[:notice] = 'Car was successfully created.'
        format.html { redirect_to([:admin,@car])}
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        flash[:notice] = 'Admin::Car was successfully updated.'
        format.html { redirect_to([:admin,@car]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to(admin_cars_url) }
      format.xml  { head :ok }
    end
  end
end

