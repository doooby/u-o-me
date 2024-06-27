class InvoicesController < ApplicationController
    before_action :set_invoice, only: %i[ show edit update destroy ]

  def index
    @invoices = Invoice.all
    @invoices.order due_date: :desc

    if param = params[:search].presence
      search_term = "%#{param}%"
      @invoices = @invoices.where 'buyer_name LIKE ? OR buyer_email LIKE ?', search_term, search_term
    end
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new invoice_params

    if @invoice.save
      redirect_to invoice_url(@invoice), notice: "Invoice was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update invoice_params
      redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy!

    respond_to do |format|
      redirect_to invoices_url, notice: "Invoice was successfully destroyed."
    end
  end

private

  def set_invoice
    @invoice = Invoice.find params[:id]
  end

  def invoice_params
    values = params.require(:invoice).permit(
      :buyer_email, :buyer_name, :buyer_address, :buyer_phonem, :due_date, :price_amount, :note
    )
    values[:due_date] = ApplicationHelper.cast_cz_date values[:due_date]
    values[:price_amount] = ApplicationHelper.cast_czk_amount values[:price_amount]
    values
  end

end
