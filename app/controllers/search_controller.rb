class SearchController < ApplicationController
  def results
    @pages = Page.search(params[:q])
  end
end

