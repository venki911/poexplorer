class SearchesController < ApplicationController
  include Concerns::Search # I shouldnt create a SearchService instead (use virtus too)

  respond_to :html

  before_filter :view_layout
  before_filter :find_search, only: [:show, :update, :destroy]

  def index
    @searches = typed_search.includes(:item).page(params[:page]).per(10)
  end

  def favorites
  end

  def show
    search
  end

  def new
    search
  end

  def create
    @search = typed_search.new(search_params)
    @search.save
    search if !@search.valid?

    respond_with @search, location: location
  end

  def update
    @search.update_attributes(search_params)
    search if !@search.valid?

    respond_with @search, location: location
  end

  private

  def location
    (@search && @search.valid?) ? @search : nil
  end

end