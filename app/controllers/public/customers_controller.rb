class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :quit, :out, :edit, :update]
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理が完了しました。"
    redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
  end
  
end
