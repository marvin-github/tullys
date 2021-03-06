class BreedersController < ApplicationController
  before_action :set_breeder, only: [:show, :edit, :update, :destroy]

  # GET /breeders
  # GET /breeders.json
  def index
    @breeders = Breeder.all
  end

  # GET /breeders/1
  # GET /breeders/1.json
  def show
  end

  # GET /breeders/new
  def new
    @breeder = Breeder.new
  end

  # GET /breeders/1/edit
  def edit
  end

  # POST /breeders
  # POST /breeders.json
  def create
    @breeder = Breeder.new(breeder_params)

    respond_to do |format|
      if @breeder.save
        format.html { redirect_to @breeder, notice: 'Breeder was successfully created.' }
        format.json { render :show, status: :created, location: @breeder }
      else
        format.html { render :new }
        format.json { render json: @breeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breeders/1
  # PATCH/PUT /breeders/1.json
  def update
    respond_to do |format|
      if @breeder.update(breeder_params)
        format.html { redirect_to @breeder, notice: 'Breeder was successfully updated.' }
        format.json { render :show, status: :ok, location: @breeder }
      else
        format.html { render :edit }
        format.json { render json: @breeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeders/1
  # DELETE /breeders/1.json
  def destroy
    @breeder.destroy
    respond_to do |format|
      format.html { redirect_to breeders_url, notice: 'Breeder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breeder
      @breeder = Breeder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breeder_params
      params.require(:breeder).permit(:first_name, :last_name, :company_name, :address1, :address2, :city, :state, :zip, :mobile_phone, :home_phone, :fax, :usda_number)
    end
end
