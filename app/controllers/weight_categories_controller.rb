class WeightCategoriesController < ApplicationController
  before_action :set_weight_category, only: [:show, :edit, :update, :destroy]

  # GET /weight_categories
  # GET /weight_categories.json
  def index
    @weight_categories = WeightCategory.all
  end

  # GET /weight_categories/1
  # GET /weight_categories/1.json
  def show
  end

  # GET /weight_categories/new
  def new
    @weight_category = WeightCategory.new
  end

  # GET /weight_categories/1/edit
  def edit
  end

  # POST /weight_categories
  # POST /weight_categories.json
  def create
    @weight_category = WeightCategory.new(weight_category_params)

    respond_to do |format|
      if @weight_category.save
        format.html { redirect_to @weight_category, notice: 'Weight category was successfully created.' }
        format.json { render :show, status: :created, location: @weight_category }
      else
        format.html { render :new }
        format.json { render json: @weight_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_categories/1
  # PATCH/PUT /weight_categories/1.json
  def update
    respond_to do |format|
      if @weight_category.update(weight_category_params)
        format.html { redirect_to @weight_category, notice: 'Weight category was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight_category }
      else
        format.html { render :edit }
        format.json { render json: @weight_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_categories/1
  # DELETE /weight_categories/1.json
  def destroy
    @weight_category.destroy
    respond_to do |format|
      format.html { redirect_to weight_categories_url, notice: 'Weight category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_category
      @weight_category = WeightCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_category_params
      params.require(:weight_category).permit(:name, :description, :require_sale_weight)
    end
end
