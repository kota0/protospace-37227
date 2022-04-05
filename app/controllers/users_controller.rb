class UsersController < ApplicationController

 def show
  @prototypes = Prototype.all
  @comment = Comment.new
  @user = User.find(params[:id])
 end
end

