class Api::V1::RatesController < Api::BaseController

  def index
    @rates = Rate.all
  end

  def show
    @rate = Rate.find(params[:id])
  end
end
