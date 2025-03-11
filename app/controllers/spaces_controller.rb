class SpacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    # Initial space query (fetch all spaces)
    @spaces = Space.all

    # If search query for space name is present, filter by name
    @spaces = @spaces.where('name LIKE ?', "%#{params[:query]}%") if params[:query].present?

    # If location is provided, filter spaces by location
    @spaces = @spaces.where('location LIKE ?', "%#{params[:location]}%") if params[:location].present?

    # If start and end dates are provided, filter spaces that are available in that period
    if params[:start_date].present? && params[:end_date].present?
      @spaces = @spaces.joins(:bookings).where("bookings.start_date <= ? AND bookings.end_date >= ?", params[:end_date], params[:start_date])
    end
  end

  def show
    # Show individual space details
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user

    if @space.save
      redirect_to spaces_path, notice: 'Space was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to spaces_path, notice: 'Space was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to spaces_url, notice: 'Space was successfully destroyed.'
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:name, :description, :location, :price)
  end
end
