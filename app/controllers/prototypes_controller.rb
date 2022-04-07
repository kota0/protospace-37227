class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def move_to_edit
    unless user_signed_in?
    redirect_to action: :edit
    end
  end


  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototypes = Prototype.find(params[:id])
    if prototypes.update(prototypes_params)
      redirect_to prototype_path(prototypes.id)
    else
      @prototype = Prototype.find(params[:id])
      render :edit 
    end
  end

  def create
    @prototypes = Prototype.new(prototypes_params)
    if @prototypes.save
       redirect_to new_user_registration_path
    else
      render :new
    end
  end

  def destroy
     prototype = Prototype.find(params[:id])
     if prototype.destroy
       redirect_to user_session_path
     end
  end
    

private
 def prototypes_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
 end
end
