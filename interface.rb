# TASK 1

# FETCH IMDB TOP MOVIES URL
# - Scrape IMDB top movies url www.imdb.com/chart/top

# Method name = #scrape_url
# - PARAMS = nil
# - RETURN = Array of urls strings

require 'nokogiri'
require 'open-uri'

def scrape_url
  top_five_urls = []
  doc = Nokogiri::HTML(open('https://www.imdb.com/chart/top').read)
    doc.search('.titleColumn a').each do |element|
    # p element.attribute('href').value
    top_five_urls << "https://www.imdb.com#{element.attribute('href').value}"
    break if top_five_urls.length == 5
  end
  p top_five_urls
end

p scrape_url



# require 'nokogiri'
# require 'open-uri'

# def scrape_url
#  url_array = []
#  html_file = open('https://www.imdb.com/chart/top').read
#  html_doc = Nokogiri::HTML(html_file)

#  html_doc.search('.titleColumn a').each do |element|
#    url_array << "https://www.imdb.com/#{element.attribute('href').value}"
#    break if url_array.length == 5
#  end
#  p url_array
# end
