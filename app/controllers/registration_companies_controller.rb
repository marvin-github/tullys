class RegistrationCompaniesController < ApplicationController
  before_action :set_registration_company, only: [:show, :edit, :update, :destroy]

  # GET /registration_companies
  # GET /registration_companies.json
  def index
    @registration_companies = RegistrationCompany.all
  end

  # GET /registration_companies/1
  # GET /registration_companies/1.json
  def show
  end

  # GET /registration_companies/new
  def new
    @registration_company = RegistrationCompany.new
  end

  # GET /registration_companies/1/edit
  def edit
  end

  # POST /registration_companies
  # POST /registration_companies.json
  def create
    @registration_company = RegistrationCompany.new(registration_company_params)

    respond_to do |format|
      if @registration_company.save
        format.html { redirect_to @registration_company, notice: 'Registration company was successfully created.' }
        format.json { render :show, status: :created, location: @registration_company }
      else
        format.html { render :new }
        format.json { render json: @registration_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_companies/1
  # PATCH/PUT /registration_companies/1.json
  def update
    respond_to do |format|
      if @registration_company.update(registration_company_params)
        format.html { redirect_to @registration_company, notice: 'Registration company was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration_company }
      else
        format.html { render :edit }
        format.json { render json: @registration_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_companies/1
  # DELETE /registration_companies/1.json
  def destroy
    @registration_company.destroy
    respond_to do |format|
      format.html { redirect_to registration_companies_url, notice: 'Registration company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_company
      @registration_company = RegistrationCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_company_params
      params.require(:registration_company).permit(:first_name, :last_name, :company_name, :address1, :address2, :city, :state, :zip, :mobile_phone, :home_phone, :fax)
    end
end
