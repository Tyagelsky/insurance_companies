class Api::V1::CompaniesController < Api::BaseController
  def index
    companies = Company.all
    render json: companies
  end

  def show
    company = Company.find(params[:id])
    render json: company
  end
end
