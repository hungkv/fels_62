class Admin::CategoriesController < ApplicationController
  before_action :set_categories, except: :index

  def index
    @categories = Category.paginate page: params[:page]
    @category = Category.new
  end

  def create
    category = Category.new category_params
    if category.save
      flash[:success] = t :create_success, scope: :admin_categories
      redirect_to admin_categories_path
    else
      flash[:danger] = t :create_failed, scope: :admin_categories
      redirect_to admin_categories_path
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t :update_success, scope: :admin_categories
      redirect_to admin_categories_path
    else
      flash[:danger] = t :update_failed, scope: :admin_categories
      redirect_to admin_categories_path
    end
  end

  def destroy
    if @category && @category.destroy
      flash[:success] = t :delete_success, scope: :admin_categories
      redirect_to admin_categories_path
    else
      flash[:danger] = t :delete_failed, scope: :admin_categories
      redirect_to admin_categories_path
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
