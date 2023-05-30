class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customers_params)
      redirect_to admin_customers_path(@customers)
    else
    render :show
    end
  end

private

  def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :email, :phone_number, :password, :is_deleted)
  end

end
