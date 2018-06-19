class SalesPlansController < ApplicationController
  before_action :set_sales_plan, only: [:show, :edit, :update, :destroy]

  # GET /sales_plans
  # GET /sales_plans.json
  def index
    @sales_plans = SalesPlan.all
  end

  # GET /sales_plans/1
  # GET /sales_plans/1.json
  def show
  end

  # GET /sales_plans/new
  def new
    @sales_plan = SalesPlan.new
  end

  # GET /sales_plans/1/edit
  def edit
  end

  # POST /sales_plans
  # POST /sales_plans.json
  def create
    @sales_plan = SalesPlan.new(sales_plan_params)

    respond_to do |format|
      if @sales_plan.save
        format.html { redirect_to @sales_plan, notice: 'Sales plan was successfully created.' }
        format.json { render :show, status: :created, location: @sales_plan }
      else
        format.html { render :new }
        format.json { render json: @sales_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_plans/1
  # PATCH/PUT /sales_plans/1.json
  def update
    respond_to do |format|
      if @sales_plan.update(sales_plan_params)
        format.html { redirect_to @sales_plan, notice: 'Sales plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_plan }
      else
        format.html { render :edit }
        format.json { render json: @sales_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_plans/1
  # DELETE /sales_plans/1.json
  def destroy
    @sales_plan.destroy
    respond_to do |format|
      format.html { redirect_to sales_plans_url, notice: 'Sales plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_plan
      @sales_plan = SalesPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_plan_params
      params.require(:sales_plan).permit(:start_date, :end_date, :variable_percent, :flat_percent, :flat_amount, :max_amount, :name)
    end
end
