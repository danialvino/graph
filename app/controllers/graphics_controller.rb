class GraphicsController < ApplicationController

  def index
    @data = send_currency(params[:data]) if params[:data].present?
  end

  private

  def send_currency(data)
    CurrencyService.new(data).call
  end

end
