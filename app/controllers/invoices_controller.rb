class InvoicesController < ApplicationController
  before_action  :authorize
  before_action  :set_invoice,  only: [:show, :edit, :update, :destroy]

  #:set_invoice,
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    if !params[:id].blank?
      @invoice.customer_id = params[:id]
    end

  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update



    respond_to do |format|
      if @invoice.user_access(session[:user_id])
        format.html { render :edit }
      elsif @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display_pdf
    @invoice = Invoice.find(params[:invoice])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice)
        send_data pdf.render,
                  filename: "#{@invoice.id}-#{@invoice.customer.last_name}-invoice.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  def get_price
    @canine = Canine.find(params[:id])
    @msg = { "success" => "true", "price" => @canine.price.to_s, :sale_discount => @canine.sale_price}
    respond_to do |format|
      format.html
      format.json { render json: @msg }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:customer_id, :canine_id, :purchase_date, :sale_price, :sale_discount,
                                      :sale_discount_reason, :paper_deliver_method, :credit_card_last_4,
                                      :payment_method_1, :payment_method_2, :payment_amount_1,
                                      :payment_amount_2, :payment_date, :veterinarian_id,
                                      :sales_person_1, :sales_person_2, :commission_percent,
                                      :return_date, :refund_amount, :refund_method, :return_reason,
                                      :invoice_status_id, :credit_card2_last_4)
    end

end
