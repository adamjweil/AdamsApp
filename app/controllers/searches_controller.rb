require 'HTTParty'
require 'Nokogiri'
require 'Pry'

class SearchesController < ApplicationController

  def index
    # url = Search.order("created_at").last.url
    # page = HTTParty.get("#{url}")
    # @parsed_page = Nokogiri::HTML(page)
    # @h1s = page.css('h1')
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
    # page = HTTParty.get("#{@search.url}")
    # parsed_page = Nokogiri::HTML(page)
    # @h1s = page.
    # @search.html = parsed_page
    page = HTTParty.get(params[:search][:url])
    @doc = Nokogiri::HTML(page)
    @h1 = []
    @h2 = []
    @h3 = []
      @doc.css('h1').each do |h1|
        @h1 << h1.text
      end
      @doc.css('h2').each do |h2|
        @h2 << h2.text
      end
      @doc.css('h3').each do |h3|
        @h3 << h3.text
      end
    # binding.pry
    @search.html = page
    @search.h1_tags = @h1
    @search.h2_tags = @h2
    @search.h3_tags = @h3
    # @parsed_page = Nokogiri::HTML(page)
    # @h1s = page.css('h1')
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
