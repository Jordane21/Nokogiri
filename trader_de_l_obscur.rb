
require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  





#récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs
