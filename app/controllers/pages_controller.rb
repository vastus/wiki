class PagesController < ApplicationController
  before_action(:set_page, :only => [:show, :edit, :update])

  def index
    @pages = Page.order("updated_at DESC")
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to(page_url(@page))
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to(page_url(@page))
    else
      render(:edit)
    end
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :user_id)
  end
end

