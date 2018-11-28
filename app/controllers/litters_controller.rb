class LittersController < ApplicationController
  before_action :set_litter, only: [:show, :edit, :update, :destroy]

  # GET /litters
  # GET /litters.json
  def index
    @litters = Litter.all
  end

  # GET /litters/1
  # GET /litters/1.json
  def show
  end

  # GET /litters/new
  def new
    @litter = Litter.new
    @litter.litter_treatments.build
  end

  # GET /litters/1/edit
  def edit
  end

  # POST /litters
  # POST /litters.json
  def create
    @litter = Litter.new(litter_params)
    @litter.litter_treatments.each do |t|
      t.treatment_date = t.treatment_date.strftime('%Y-%d-%m')
     end


    respond_to do |format|
      if @litter.save
        format.html { redirect_to @litter, notice: 'Litter was successfully created.' }
        format.json { render :show, status: :created, location: @litter }
      else
        format.html { render :new }
        format.json { render json: @litter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /litters/1
  # PATCH/PUT /litters/1.json
  def update

    params[:litter][:litter_treatments_attributes].values.each do |l|
      l[:treatment_date] = Date.parse(l[:treatment_date]).strftime('%Y-%d-%m')
    end
    respond_to do |format|
      if @litter.update(litter_params)
        format.html { redirect_to @litter, notice: 'Litter was successfully updated.' }
        format.json { render :show, status: :ok, location: @litter }
      else
        format.html { render :edit }
        format.json { render json: @litter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /litters/1
  # DELETE /litters/1.json
  def destroy
    @litter.destroy
    respond_to do |format|
      format.html { redirect_to litters_url, notice: 'Litter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_litter
      @litter = Litter.find(params[:id])
      @litter.litter_treatments.each do |t|
        t.treatment_date = t.treatment_date.strftime('%m-%d-%Y')
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def litter_params
      params.require(:litter).permit(:name, :arrival_date, :available_date, :birth_date,
                                     :breed_id, :breeder_id, :dam_id, :sire_id, :male_count,
                                     :female_count, litter_treatments_attributes:[:_destroy, :id, :litter_id, :treatment_type_id, :treatment_date])
    end
end
