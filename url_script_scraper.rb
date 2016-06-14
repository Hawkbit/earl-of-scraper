# This script by Shawn Shrader 2016 uses Nokogiri gem to scrape a URL for
# script tags and prints their content to a text file for parsing.

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

time = Time.now.strftime('%Y%m%d%H%M%S')
filename = "#{time}_url_list.txt"
target = open(filename, 'w')

#url_arr = CSV.read('URL_LIST.csv')
#arr = url_arr.to_s
arr = "http://wikipedia.org", "http://cnn.com"

i = 0
arr.each do |url|

  page = Nokogiri::HTML(open(url))
  puts "URL: " + url + "\n"
  i += 1
  target.write("#{i}) URL: " + url + "\n")
  page.xpath('//div/script').each do |link, index|

    puts link.content

    target.write(link.content)
  end

  #target.write(url + "\n")
end

target.close
