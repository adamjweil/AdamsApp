class SearchesController < ApplicationController

  def index
    # @searches = Search.all
  end

  def show
  end

  def new
    @search = Search.new
  end

  def edit
  end

  def create
    find_user
    @search = Search.new(search_params)
    @search.user_id = @user.id
      if @search.save
        redirect_to "/"
      else
        render plain: "failure", status: 422
      end
  end


  private

    def search_params
      params.require(:search).permit(:url)
    end
end
