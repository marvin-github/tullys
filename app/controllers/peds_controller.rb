class PedsController < ApplicationController
  before_action :set_pedigree, only: [:show, :edit, :update, :destroy]

  # GET /pedigrees
  # GET /pedigrees.json
  def index
    @pedigrees = Ped.all
  end

  # GET /pedigrees/1
  # GET /pedigrees/1.json
  def show
  end

  # GET /pedigrees/new
  def new
    @ped = Ped.new
  end

  # GET /pedigrees/1/edit
  def edit
  end

  # POST /pedigrees
  # POST /pedigrees.json
  def create
    @pedigree = Ped.new(pedigree_params)

    respond_to do |format|
      if @ped.save
        format.html { redirect_to @ped, notice: 'Pedigree was successfully created.' }
        format.json { render :show, status: :created, location: @pedigree }
      else
        format.html { render :new }
        format.json { render json: @pedigree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedigrees/1
  # PATCH/PUT /pedigrees/1.json
  def update
    respond_to do |format|
      if @pedigree.update(pedigree_params)
        format.html { redirect_to @ped, notice: 'Pedigree was successfully updated.' }
        format.json { render :show, status: :ok, location: @ped }
      else
        format.html { render :edit }
        format.json { render json: @ped.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedigrees/1
  # DELETE /pedigrees/1.json
  def destroy
    @pedigree.destroy
    respond_to do |format|
      format.html { redirect_to pedigrees_url, notice: 'Pedigree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedigree
      @pedigree = Ped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedigree_params
      params.require(:pedigree).permit(:name, :breed, :gender, :customer_id)
    end
end
