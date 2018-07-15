
class InvoicePdf < Prawn::Document

  @@purchase_date = ''
  @@sale_discount = ''
  @@sale_price = ''
  @@total_price = ''
  @@sale_discount_reason = ''
  @@payment_method_1 = ''
  @@payment_method_2 = ''
  @@payment_amount_1 = ''
  @@payment_amount_2 = ''
  @@payment_date = ''
  @@veterinarian_id = ''
  @@sales_person_1 = ''
  @@sales_person_2 = ''
  @@commission_percent = ''
  @@return_date = ''
  @@refund_amount = ''
  @@invoice_status_id = ''
  @@payment_amount_1 = ''
  @@payment_method_1 = ''
  @@payment_amount_2 = ''
  @@payment_method_2 = ''
  @@card_1 = ''
  @@card_2 = ''


  def init_invoice(i)
    payment_methods_h = {}
    payment_methods = PaymentMethod.all
    payment_methods.each do |p|
      payment_methods_h[p.id] = p.name
    end

    puts i.pretty_print_inspect
    unless i.purchase_date.blank?
      @@purchase_date = i.purchase_date.strftime("%m/%d/%Y")
    end
    unless i.purchase_date.blank?
      @@payment_date = i.purchase_date.strftime("%m/%d/%Y")
    end

    unless i.sales_person_1.blank?
      @@sales_person_1 = SalesPerson.find(i.sales_person_1).first_last_name
    end

    unless i.sales_person_2.blank?
      @@sales_person_2 = SalesPerson.find(i.sales_person_2).first_last_name
    end

    unless i.sale_price.blank?
      @@sale_price = "$"+ sprintf('%.2f',i.sale_price.to_s)
      @@total_price = "$"+ sprintf('%.2f',i.sale_price.to_s)
    end

    unless i.sale_discount.blank?
      @@sale_discount = "$"+ sprintf('%.2f',i.sale_discount.to_s)
      total_price = i.sale_price - i.sale_discount
      @@total_price = "$"+ sprintf('%.2f',total_price.to_s)
    end

    if !i.sale_discount_reason.blank?
      @@sale_discount_reason = i.sale_discount_reason
    end

    if !i.payment_method_1.blank?
      @@payment_method_1 = payment_methods_h[i.payment_method_1]
    end
    if !i.payment_amount_1.blank?
      @@payment_amount_1 = "$"+ sprintf('%.2f',i.payment_amount_1.to_s)
    end
    if !i.credit_card_last_4.blank?
      @@card_1 = "[" + i.credit_card_last_4.to_s + "]"
    end
    if !i.payment_method_2.blank?
      @@payment_method_2 = payment_methods_h[i.payment_method_2]
    end
    if !i.payment_amount_2.blank?
      @@payment_amount_2 = "$"+ sprintf('%.2f',i.payment_amount_2.to_s)
    end
    if !i.credit_card2_last_4.blank?
      @@card_2 = "[" + i.credit_card2_last_4.to_s + "]"
    end
  end

  def initialize(invoice)
    init_invoice(invoice)
    super(top_margin: 70)
    font_size = 11
    time = Time.now.to_s

    text "Sale Form", :align => :center, :size => 14, :style => :bold
    move_down 10
    text "Tully's Kennel", :align => :center, :size => 8
    #text "7777 D Street", :align => :center, :size => 8
    #text "Omaha, NE 68022", :align => :center, :size => 8
    #text "(402) 391-2456", :align => :center, :size => 8
    #text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size => 8


    #------------SALES---------------
    formatted_text_box [{:text => "Sales",  :size => 14, :style => :bold, :color => '000000'}], :at => [0, y - 40]
    move_down 10
    text "_" * 80
    move_down 7
    formatted_text_box [{:text => "Invoice Id:",  :size => 8,  :color => '000000'}], :at => [0, y - 40]
    text_box  invoice.id.to_s, :at => [100, y - 40], :size => 8,  :color => '0000ff'

    formatted_text_box [{:text => "Purchased Date:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box  @@purchase_date, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    #------------price
    formatted_text_box [{:text => "Price:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box  @@sale_price, :at => [100, y - 40], :size => 8,  :color => '0000ff'

    formatted_text_box [{:text => "Sales People:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box @@sales_person_1,:at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15


    #-----------discount
    formatted_text_box [{:text => "Discount:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box  @@sale_discount, :at => [100, y - 40], :size => 8,  :color => '0000ff'

    text_box @@sales_person_2,:at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    #___________total price
    formatted_text_box [{:text => "Total Price:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box  @@total_price, :at => [100, y - 40], :size => 8,  :color => '0000ff'

    formatted_text_box [{:text => "Payment Date:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box  @@payment_date, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    #___________card data
    formatted_text_box [{:text => "Payment 1:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box  @@payment_amount_1 + "  " + @@payment_method_1 + "  " + @@card_1, :at => [100, y - 40], :size => 8,  :color => '0000ff'

    formatted_text_box [{:text => "Payment 2:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box  @@payment_amount_2 + "  " + @@payment_method_2 + "  " + @@card_2, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    #___________discount reason
    formatted_text_box [{:text => "Discount Reason:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box  @@sale_discount_reason, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    move_down 30


    #--------CUSTOMER---------------
    formatted_text_box [{:text => "Customer",  :size => 14, :style => :bold, :color => '000000'}], :at => [0, y - 40]
    move_down 10
    text "_" * 80
    move_down 7
    formatted_text_box [ {:text => "Customer Id:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.customer.id.to_s,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    move_down 15
    formatted_text_box [ {:text => "Name:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.customer.first_last_name,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Email:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.customer.email, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Address 1:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.customer.address1, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Home Phone:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.customer.home_phone, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Address 2:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.customer.address2, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Mobile Phone:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.customer.mobile_phone, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "City:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.customer.city, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    move_down 30



    # --------------canine--------------
    formatted_text_box [{:text => "Canine",  :size => 14, :style => :bold, :color => '000000'}], :at => [0, y - 40]
    move_down 10
    text "_" * 80
    move_down 7
    formatted_text_box [ {:text => "Canine Id:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.canine.id.to_s,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Description:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.canine.description,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Sale Weight:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.canine.sale_weight, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Microchip Number:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.canine.micro_chip_number,  :at => [100, y - 40], :size => 8,  :color => '0000ff' unless invoice.canine.micro_chip_number.blank?
    formatted_text_box [ {:text => "Registration:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.canine.registration_number, :at => [375, y - 40], :size => 8,  :color => '0000ff' unless invoice.canine.registration_number.blank?
    move_down 15

    formatted_text_box [ {:text => "Born:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.canine.litter.birth_date.strftime("%m/%d/%Y"),:at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Arrived:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.canine.litter.arrival_date.strftime("%m/%d/%Y"), :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Mail/Pickup:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.paper_deliver_method,:at => [100, y - 40], :size => 8,  :color => '0000ff'

    move_down 30




    #--------VETERINARIAN---------------
    formatted_text_box [{:text => "Veterinarian",  :size => 14, :style => :bold, :color => '000000'}], :at => [0, y - 40]
    move_down 10
    text "_" * 80
    move_down 7
    formatted_text_box [ {:text => "Veterinarian Id:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.veterinarian.id.to_s,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    move_down 15
    formatted_text_box [ {:text => "Name:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.veterinarian.company_name,:at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Phone:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.veterinarian.home_phone, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Address 1:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.veterinarian.address1, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "Hours:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.veterinarian.business_hours, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 15

    formatted_text_box [ {:text => "Address 2:",  :size => 8, :color => '000000'}], :at => [0, y - 40]
    text_box invoice.veterinarian.address2, :at => [100, y - 40], :size => 8,  :color => '0000ff'
    formatted_text_box [ {:text => "City/St/Zip:",  :size => 8, :color => '000000'}], :at => [275, y - 40]
    text_box invoice.veterinarian.city + ', '+ invoice.veterinarian.state + ' ' + invoice.veterinarian.zip, :at => [375, y - 40], :size => 8,  :color => '0000ff'
    move_down 30
    



  end




end