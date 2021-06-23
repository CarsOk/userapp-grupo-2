class UserController < ApplicationController
    def index
       usuario= User.all
        render json: usuario, status: 200
      end
    
      def create
        usuario = User.create(
          name: params[:name],
          email: params[:email],
          year: params[:year],
        )
        render json: usuario, status: 201
      end
    
      def show
        
        usuario = User.find(params[:id])
        render json: usuario, estatus: 200
      end

end
