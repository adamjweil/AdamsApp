class SearchesController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    # @searches = Search.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @search = Search.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @search = Search.new(search_params)

    # respond_to do |format|
      if @search.save
        # session[:user_id] = @user.id
        redirect_to "/"
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
        # render plain: "success", status: 201
      else
        render plain: "failure", status: 422
      end
    # end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find_by(id: params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:username, :url)
    end
end
