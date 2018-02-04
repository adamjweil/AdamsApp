require 'HTTParty'
require 'Nokogiri'
require 'Pry'

class SearchesController < ApplicationController

  def index
  end

  def show
    @search = Search.find_by(id: params[:id])
    count = 0
    begin
    # Get raw source code
    @raw_page = HTTParty.get(@search.url)
    # Convert source code into usable Nokogiri object
    @noko_page = Nokogiri::HTML(@raw_page)
  rescue Errno::ECONNRESET => e
    count += 1
    retry unless count > 10
    puts "tried 10 times and couldn't get #{@search.url}: #{e}"
  end
    # Initialize empty arrays that are going to store content from H1, H2, and H3 tags, as well as any links. I am choosing to store this data into arrays, rather than a string or a hash because I am going to need to iterate over this data in my view page, and I find iterating over an array to be the easiest option.
    @h1_tags = []
    @h2_tags = []
    @h3_tags = []
    @links = []

    # Store content from h1 tags into the array created above.
    @noko_page.css('h1').each do |h1|
      @h1_tags << h1.text
    end
    # Store content from h2 tags into the array created above.
    @noko_page.css('h2').each do |h2|
      @h2_tags << h2.text
    end
    # Store content from h3 tags into the array created above.
    @noko_page.css('h3').each do |h3|
      @h3_tags << h3.text
    end
    ### IMPORTANT: Since external links can be in the form of hrefs or img tags, I need to create a case statement to make sure I am capturing both of these
    @links = @noko_page.css('a', 'img').map{ |tag|
      case tag.name.downcase
        when 'a'
          tag['href']
        when 'img'
          tag['src']
      end
      }
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

      @raw = HTTParty.get(@search.url)
      @parsed_page = Nokogiri::HTML(@raw)
      # @search.html = parsed_page
      # @search.save

      if @search.save
        redirect_to "/searches/#{@search.id}"
      else
        render plain: "tried 5 times and couldn't get #{@search.url}"
      end

      # if @search.save
      #     redirect_to "/searches/#{@search.id}"
      #   # else
      #   #   render plain: "failure", status: 422
      # end
  end

  private
    def search_params
      params.require(:search).permit(:url)
    end
end
