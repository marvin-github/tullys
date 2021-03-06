class CaninesController < ApplicationController
  before_action :set_canine, only: [:show, :edit, :update, :destroy]
  after_action :create_treatments, only: :create
  # GET /canines
  # GET /canines.json
  def index
    @canines = Canine.all.order(micro_chip_number: :asc)
  end

  # GET /canines/1
  # GET /canines/1.json
  def show
  end

  # GET /canines/new
  def new
    @canine = Canine.new
    @canine.treatments.build
  end

  # GET /canines/1/edit
  def edit
  end

  # POST /canines
  # POST /canines.json
  def create
    @canine = Canine.new(canine_params)

    respond_to do |format|
      if @canine.save



        format.html { redirect_to action: 'index', notice: 'Canine was successfully created.' }
        format.json { render :show, status: :created, location: @canine }
      else
        format.html { render :new }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_treatments

    canine = Canine.last
    litter_treatments = LitterTreatment.where("litter_id = ?", canine.litter_id)
    litter_treatments.each do |l|
      #@model.date_you_want = @model.date_you_want.strftime('%Y/%d/%m')
      Treatment.create!(canine_id: canine.id, treatment_type_id: l.treatment_type_id, treatment_date: l.treatment_date )
    end

  end

  # PATCH/PUT /canines/1
  # PATCH/PUT /canines/1.json
  def update

    respond_to do |format|
      if @canine.update(canine_params)
        format.html { redirect_to action: 'index', notice: 'Canine was successfully updated.' }
        format.json { render :show, status: :ok, location: @canine }
      else
        format.html { render :edit }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canines/1
  # DELETE /canines/1.json
  def destroy
    @canine.destroy
    respond_to do |format|
      format.html { redirect_to canines_url, notice: 'Canine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canine
      @canine = Canine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canine_params
      params.require(:canine).permit(:litter_id, :micro_chip_number, :gender_id, :color,
                                     :arrival_weight, :weight_category_id, :sale_weight,
                                     :price, :sale_price, :fault_description,
                                     :fault_discount, :fault_discount, :registration_company_id,
                                     :on_hold, :on_hold_reason, :available_date, :last_sold_date,
                                     :cost, :sale_status_id, :description, :registration_number,
                                     treatments_attributes:[:_destroy, :id, :canine_id, :treatment_type_id, :treatment_date])
    end
end
