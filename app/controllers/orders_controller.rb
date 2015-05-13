class OrdersController < ApplicationController

  def index
    @orders = Order.where(send_user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def send_to_user
    @order = current_order
    if @order.send!(send_to_user_params)
      session[:current_order] = nil
      flash[:notice] = 'Товары отправлены'
    else
      flash[:alert] = 'Не удалось отправить товары'
    end
    redirect_to products_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    #current_order.line_items.delete_all
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order destroyed' }
      format.json { head :no_content }
    end
  end

  private

    def send_to_user_params
      params.require(:order).permit(:send_user_id, :email, :fio, :phone_number)
    end

end
