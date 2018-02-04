require 'Nokogiri'
require 'HTTParty'
require 'Pry'

class Search < ApplicationRecord
  validates :url, :user_id, presence: true
  belongs_to :user

end
