class ProductsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart
    
    def new
        @product = current_user.products.new
    end


    def index 
    @products = Product.all
    # @order_items= current_order.order_items.new
    end
  
     def search
        
        @products=Product.where("name LIKE ?","%"+params[:q]+"%")
     end
    def create
        @product = current_user.products.new(product_params)
        if  @product.save
            redirect_to @product, notice: "product create!"
        else
            render 'new'
        end
    end
    
    def show
         @product= Product.find(params[:id])
         
    end
    
  
      

    
    def edit
        
        @product= Product.find(params[:id])
       
end
    def update
        
        @product = Product.find(params[:id])
        if @product.user_id == current_user.id
        if @product.update(product_params)
            redirect_to @product, notice: "product update!"
            else
                render 'edit'
            end
        else
            redirect_to @product, notice: "you can update your own product"
        end
    end
    
    def destroy
       
        @product= Product.find(params[:id])
         if user_signed_in? 
         if @product.user_id != current_user.id 
            redirect_to @product, alert: "you can delete your own product"
        else
            @product.destroy
            redirect_to root_path
    end
else
    redirect_to @product, alert: "please login first for perform this action"
end
   
end
def add_to_cart
   
    id=params[:id].to_i
    q=params[:quantity].to_i
    session[:cart]<< id && q unless session[:cart].include?(id)
   

    redirect_to products_path(), alert: "item added in your cart"
  end

  def remove_from_cart
    id=params[:id].to_i
    session[:cart].delete(id)
    redirect_to products_path(), alert: "product removed from cart"
  end
private
   def product_params
    params.require(:product).permit(:id,:name, :price, :description, :image, :user_id)
   end

   def initialize_session
    session[:cart]||=[] 
   end
    def load_cart
        @cart =Product.find(session[:cart])  
end
end
