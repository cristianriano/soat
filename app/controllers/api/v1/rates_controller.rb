class Api::V1::RatesController < Api::BaseController

  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      render status: 201, template: 'api/v1/rates/show'
    else
      render status: 400, json: @rate.errors.messages.to_json
    end
  end

  def index
    @rates = Rate.all
  end

  def show
    @rate = Rate.find(params[:id])
  end

  def update
    @rate = Rate.update(params[:id], rate_params)
    render status: 200, template: 'api/v1/rates/show'
  end

  def destroy
    @rate = Rate.find(params[:id]).destroy
    render status: 200, template: 'api/v1/rates/show'
  end

  private

  def rate_params
    params.require(:rate).permit(:code, :category, :subcategory, :min_age, :max_age, :bonus, :total)
  end
end
