class PagesController < ApplicationController
  load_and_authorize_resource(:param_method => :page_params)

  def index
    @pages = Page.order("updated_at DESC").limit(5)
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

  def page_params
    params.require(:page).permit(:title, :content, :user_id)
  end
end

