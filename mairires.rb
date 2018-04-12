require 'rubygems'
require 'nokogiri'   
require 'open-uri'

page_url = ("http://annuaire-des-mairies.com/")

def get_the_email_of_a_townhal_from_its_webpage(url_mairie)         # Définition de ma méthode pour rechercher l'adresse e-mail
	page = Nokogiri::HTML(open(page_url))                       # J'appelle ma page .html
	puts page.css('td')[7].text                                 # Je demande d'extraire le texte via le CSS, emplacement td, element 7
end 
#get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html") #Je ne l'appelle pas.. C'était uniquement la partie 1 de l'exo


def get_all_the_urls_of_val_doise_townhalls(page_url)               # Définition de ma méthode pour extraire les différentes urls
	page = Nokogiri::HTML(open(page_url)) 
	array = Array.new                                           # Je prépare un tableau vide pour y stocker les urls des mairies
	page.css(".lientxt[href]").select {|link| puts link['href'].gsub("./", "http://annuaire-des-mairies.com/")} # Je demande l'ouverture de l'url souhaité	
    array.push("#{array2}")
    array
end
# get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html") #La méthode fontionne mais je n'en ai plus besoin

def get_the_emails_of_towns(get_all_the_urls_of_val_doise_townhalls) # Définition de ma méthode pour rechercher TOUTES les adresses e-mail
	pages = Nokogiri::HTML(open(get_all_the_urls_of_val_doise_townhalls))    
	for i in 0..get_all_the_urls_of_val_doise_townhalls.length-1 # Petite boucle des familles
	puts pages.css('td')[7].text
end
puts get_the_emails_of_towns


name_mairie = page.css("a.lientxt").text                             # Nom des communes
url_mairie = get_all_the_urls_of_val_doise_townhalls                 # Urls des mairies
mail_mairie = get_the_emails_of_towns                                # E-mails des mairies

def final_list							     # Dernière méthode pour assembler les éléments récoltés et les afficher propre =)
	list = Hash[:name => name_mairie, :email=> mail_mairie, :url_link => url_mairie] #Création du Hash pour afficher mes datas récoltées
end
puts final_list
