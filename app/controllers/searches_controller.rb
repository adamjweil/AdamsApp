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
      # binding.pry
    rescue StandardError
      false
    end

    # Initialize empty arrays that are going to store content from H1, H2, and H3 tags, as well as any links. I am choosing to store this data into arrays, rather than a string or a hash because I am going to need to iterate over this data in my view page, and I find iterating over an array to be the easiest option.
    @h1_tags = []
    @h2_tags = []
    @h3_tags = []
    @h4_tags = []
    @h5_tags = []
    @p_tags = []
    @li_tags = []
    @links = []
    @imgs = []

    if @noko_page
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
      # Store content from h4 tags into the array created above.
      @noko_page.css('h4').each do |h4|
        @h4_tags << h4.text
      end
      # Store content from p tags into the array created above.
      @noko_page.css('p').each do |p_tag|
        @p_tags << p_tag.text
      end
      # Store content from li tags into the array created above.
      @noko_page.css('li').each do |li|
        @li_tags << li.text
      end

      @imgs = @noko_page.css('img').map { |x| x['src'] }

      # @noko_page.css('img').attr('src').each do |src|
      #   @imgs << src.text
      # end
      @links = @noko_page.css('a').map { |x| x['href'] }
      ### IMPORTANT: Since external links can be in the form of hrefs or img tags, I need to create a case statement to make sure I am capturing both of these
      # @links = @noko_page.css('a', 'img').map{ |tag|
      #   case tag.name.downcase
      #     when 'a'
      #       tag['href']
      #     when 'img'
      #       tag['src']
      #   end
      #   }
    end
  # else
  end

  def new
    @search = Search.new
  end

  def edit
  end

  def create
    # find_user
    @search = Search.new(search_params)
    # @search.user_id = @user.id
    @search.user_id = session.id
    # binding.pry
    begin
      @raw = HTTParty.get(@search.url)
      @parsed_page = Nokogiri::HTML(@raw)
    rescue StandardError
      false
    end

      if @search.save
        redirect_to "/searches/#{@search.id}"
      else
        render plain: "Can't load #{@search.url}... pls try another URL"
      end
  end

  private
    def search_params
      params.require(:search).permit(:url)
    end
end
