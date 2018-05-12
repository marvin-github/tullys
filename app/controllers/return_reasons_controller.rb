class ReturnReasonsController < ApplicationController
  before_action :set_return_reason, only: [:show, :edit, :update, :destroy]

  # GET /return_reasons
  # GET /return_reasons.json
  def index
    @return_reasons = ReturnReason.all
  end

  # GET /return_reasons/1
  # GET /return_reasons/1.json
  def show
  end

  # GET /return_reasons/new
  def new
    @return_reason = ReturnReason.new
  end

  # GET /return_reasons/1/edit
  def edit
  end

  # POST /return_reasons
  # POST /return_reasons.json
  def create
    @return_reason = ReturnReason.new(return_reason_params)

    respond_to do |format|
      if @return_reason.save
        format.html { redirect_to @return_reason, notice: 'Return reason was successfully created.' }
        format.json { render :show, status: :created, location: @return_reason }
      else
        format.html { render :new }
        format.json { render json: @return_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /return_reasons/1
  # PATCH/PUT /return_reasons/1.json
  def update
    respond_to do |format|
      if @return_reason.update(return_reason_params)
        format.html { redirect_to @return_reason, notice: 'Return reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @return_reason }
      else
        format.html { render :edit }
        format.json { render json: @return_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /return_reasons/1
  # DELETE /return_reasons/1.json
  def destroy
    @return_reason.destroy
    respond_to do |format|
      format.html { redirect_to return_reasons_url, notice: 'Return reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return_reason
      @return_reason = ReturnReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def return_reason_params
      params.require(:return_reason).permit(:name, :description)
    end
end
