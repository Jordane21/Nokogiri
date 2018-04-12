require 'rubygems'
require 'nokogiri'   
require 'open-uri'
=begin
def get_the_email_of_a_townhal_from_its_webpage(page_url)
	page = Nokogiri::HTML(open(page_url))    
	puts page.css('td')[7].text
end 

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html") 
=end

def get_all_the_urls_of_val_doise_townhalls(page_url)
	page = Nokogiri::HTML(open(page_url)) 
	page.css(".lientxt[href]").select {|link| puts link['href'].gsub("./", "http://annuaire-des-mairies.com/")} 
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
