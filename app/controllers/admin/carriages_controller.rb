class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: [:create, :new]

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriages_params)

    if @carriage.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit
    @carriage = Carriage.find(params[:id])
  end

  def update
    @carriage = Carriage.find(params[:id])

    if @carriage.update(carriages_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  private
  def carriages_params
    params.require(:carriage).permit(:number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

end