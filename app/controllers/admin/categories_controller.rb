class Admin::CategoriesController < ApplicationController
  before_action :set_categories, except: :index

  def index
    @categories = Category.paginate page: params[:page]
    @category = Category.new
  end

  def create
    category = Category.new category_params
    if category.save
      flash[:notice] = t :create_success, scope: :admin_categories
      redirect_to admin_category_path category
    else
      flash[:notice] = t :create_failed, scope: :admin_categories
      redirect_to :back
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:notice] = t :update_success, scope: :admin_categories
      redirect_to admin_categories_path
    else
      flash[:notice] = t :update_failed, scope: :admin_categories
      redirect_to :back
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = t :delete_success, scope: :admin_categories
      redirect_to admin_categories_path
    else
      flash[:notice] = t :delete_failed, scope: :admin_categories
      redirect_to :back
    end
  end

  private
  def category_params
    params.require(:category).permit :title, :description, :content
  end

  def set_categories
    @category = Category.find params[:id] rescue nil
  end
end
