class PublicController < ApplicationController

  def index
  end

  def invoice
    public_slug = params[:slug]
    @invoice = Invoice.find_by! public_slug:;
  end

end
