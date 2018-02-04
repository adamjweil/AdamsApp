require 'Nokogiri'
require 'HTTParty'
require 'Pry'

class Search < ApplicationRecord
  validates :url, :user_id, :html, presence: true

  belongs_to :user


  # def h1_tags
  #   url = @search.url
  #   @page = HTTParty.get("#{url}")
  #   parsed_page = Nokogiri::HTML(page)
  # end
end
