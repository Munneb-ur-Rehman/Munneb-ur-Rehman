class CommentsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        if @product.user_id != current_user.id
        @comment = @product.comments.create(comment_params.merge(user_id: current_user.id))
        redirect_to @product, alert: "done"
        else
        redirect_to @product, alert: "you can't post comments on your products"
       
        end
      end
      
     
     
      def destroy
        @product = Product.find(params[:product_id])
        @comment = @product.comments.find(params[:id])
        if @comment.user_id != current_user.id
          redirect_to @product, alert: "you can delete your own comments"
         
        else 
           @comment.destroy
           redirect_to @product, alert: "done"
        end
      end
     
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
