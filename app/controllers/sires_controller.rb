class SiresController < ApplicationController
  before_action :set_sire, only: [:show, :edit, :update, :destroy]

  # GET /sires
  # GET /sires.json
  def index
    @sires = Sire.all.order(registration_number: :asc)
  end

  # GET /sires/1
  # GET /sires/1.json
  def show
  end

  # GET /sires/new
  def new
    @sire = Sire.new
  end

  # GET /sires/1/edit
  def edit
  end

  # POST /sires
  # POST /sires.json
  def create
    @sire = Sire.new(sire_params)

    respond_to do |format|
      if @sire.save
        format.html { redirect_to @sire, notice: 'Sire was successfully created.' }
        format.json { render :show, status: :created, location: @sire }
      else
        format.html { render :new }
        format.json { render json: @sire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sires/1
  # PATCH/PUT /sires/1.json
  def update
    respond_to do |format|
      if @sire.update(sire_params)
        format.html { redirect_to @sire, notice: 'Sire was successfully updated.' }
        format.json { render :show, status: :ok, location: @sire }
      else
        format.html { render :edit }
        format.json { render json: @sire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sires/1
  # DELETE /sires/1.json
  def destroy
    @sire.destroy
    respond_to do |format|
      format.html { redirect_to sires_url, notice: 'Sire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sire
      @sire = Sire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sire_params
      params.require(:sire).permit(:name, :breed_id, :breeder_id, :registration_number, :comment, :picture_id)
    end
end
