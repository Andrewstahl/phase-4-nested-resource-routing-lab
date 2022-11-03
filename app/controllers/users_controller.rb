class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user, include: :items
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end
  
  def items_index
    user = User.find(params[:user_id])
    items = user.items 
    render json: items 
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end
  
  def item_show
    user = User.find(params[:user_id])
    item = user.items.find(params[:item_id])
    render json: item  
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Item not found" }, status: :not_found
  end
  
  def item_create
    user = User.find(params[:user_id])
    item = user.items.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    render json: item, status: :created
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

end
