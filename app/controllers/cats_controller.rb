class CatsController < ApplicationController

  def index
     cats = Cat.all
    render json: cats
  end
  
  def create
    new_cat = Cat.create(cat_params)
    if new_cat.valid?
      render json: new_cat
      else
        render json: new_cat.errors, status: 422
    end
  end
      
  def update
    edit_cat = Cat.find(params[:id])
    edit_cat.update(cat_params)
    if edit_cat.valid?
      render json: edit_cat
    else
      render json: edit_rapper.errors, status: 422
    end
  end
        
  def destroy
    delete_cat = Cat.find(params[:id])
    cats = Cat.all
    if delete_cat.destroy
      render json: cats
    else
      render json: delete_cat.errors
    end  
  end
      
  private
  def cat_params
    params.require(:cat).permit(:name, :age, :enjoys, :image)
  end

end
