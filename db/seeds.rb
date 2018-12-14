# [
#   User,
#   Region,
#   Winery,
#   Color,
#   Bottle,
#   Review,
#   UserBottle,
#   Wish
# ].each(&:destroy_all)

# user = User.create! email: "a@a.com", password: "123456"

# region = Region.create! name: "Rousillon"
# winery = Winery.create! name: "Domaine du Chateau"
# color = Color.create! name: "Rouge"

# bottle = Bottle.create!(
#   region: region,
#   winery: winery,
#   color: color,
#   bio: false,
#   title: "Les vignes",
#   grapes: "100\% grenache",
#   designation: "designation",
#   terroir: "terroir",
#   harvest: "harvest",
#   viticulture: "viticulture",
#   winemaking: "winemaking",
#   alcool: "alcool",
#   nose: "nose",
#   appearance: "rouge profond",
#   taste: "taste",
#   tasting_advice: "ouvrir 30min à l'avance",
#   wine_pairing: "viande rouge, fromage",
#   year: 1992,
#   best_before: 2022,
#   best_after: 2000,
#   price: 890,
# )

# bottle.remote_photo_url = 'https://www.1jour1vin.com/data/uploads/productimg/generated/xdomaine-chapoutier-cotes-roussillon-occultum-2013-G_544677b05201a_566019c8b7065_105x204.png.pagespeed.ic.-PqqnsU-uB.webp'
# bottle.save!

# Review.create!(
#   bottle: bottle,
#   rating: 5,
#   user: user,
#   comment: 'délicieux !',
#   tasting_date: Date.today
# )

# UserBottle.create!(
#   user: user,
#   bottle: bottle,
#   quantity: 5
# )

# Wish.create!(
#   user: user,
#   bottle: bottle
# )


#### DO NOT REMOVE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

require 'open-uri'
require 'nokogiri'


puts "destroying all reviews"
Review.destroy_all
puts "reviews destroyed !"

puts "destroying all wishes"
Wish.destroy_all
puts "wishes destroyed !"

puts "destroying all bottles"
Bottle.destroy_all
puts "bottles destroyed !"

puts "destroying all users"
User.destroy_all
puts "users destroyed !"

puts "creating users"
manon = User.create(email: "manoncharron8@gmail.com", password: "123456")
francois = User.create(email: "f.hameau@gmail.com", password: "123456")
philippine = User.create(email: "alyssa_phi@hotmail.com", password: "123456")
antoine = User.create(email: "antoine.fourgous1997@gmail.com", password: "123456")
puts "users created !"

puts "destroying all regions"
Region.destroy_all
puts "regions destroyed !"

puts "creating regions"
bordeaux = Region.create(name: 'Bordeaux')
alsace = Region.create(name: 'Alsace')
corse = Region.create(name: 'Corse')
provence = Region.create(name: 'Provence')
beaujolais = Region.create(name: 'Baujolais')
jura = Region.create(name: 'Jura')
rhone = Region.create(name: 'Rhône')
afrique_du_sud = Region.create(name: 'Afrique du sud')
argentine = Region.create(name: 'Argentine')
languedoc = Region.create(name: 'Languedoc')
roussillon = Region.create(name: 'Roussillon')
chili = Region.create(name: 'Chili')
bourgogne = Region.create(name: 'Bourgogne')
loire = Region.create(name: 'Loire')
savoie = Region.create(name: 'Savoie')
espagne = Region.create(name: 'Espagne')
champagne = Region.create(name: 'Champagne')
normandie = Region.create(name: 'Normandie')
sud_ouest = Region.create(name: 'Sud ouest')
italie = Region.create(name: 'Italie')
france = Region.create(name: 'France')
puts "regions created !"

puts "destroying all colors"
Color.destroy_all
puts "colors destroyed !"

puts "creating colors"
rouge = Color.create(name: 'Rouge')
blanc = Color.create(name: 'Blanc')
rose = Color.create(name: 'Rose')
effervescent = Color.create(name: 'Effervescent')
puts "colors created !"

puts "creating bottles"

# iteration sur les régions
wine_regions = ['bordeaux', 'alsace', 'corse', 'provence','afrique-du-sud', 'beaujolais', 'jura', 'rhone', 'argentine', 'languedoc', 'roussillon', 'chili', 'bourgogne', 'loire', 'savoie', 'espagne', 'champagne', 'normandie', 'sud-ouest', 'italie']
wine_regions.each do |region_item|
  url = "https://www.1jour1vin.com/fr/guide-achat-vin/#{region_item}"
  sleep(rand(1..3))
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  # scrapping sur la short-card
  html_doc.search('.products .row').each do |element|
    bottle = Bottle.new
    bottle_url = ''

    # récupération de l'url de la photo
    element.search('.product-thumb a img').each do |el|
      bottle.remote_photo_url = 'https://www.1jour1vin.com/' + el['src']
    end

    # récupération du lien de la fiche produit
    element.search('.description-product h3 a').each do |el|
      bottle_url = 'https://www.1jour1vin.com' + el['href']
    end

    # switch URL => récupération des détails de la fiche bouteille
    html_file_bottle = open(bottle_url).read
    html_doc_bottle = Nokogiri::HTML(html_file_bottle)


    # récupération des accords mets/vins
    html_doc_bottle.search('.suggestion-body').each do |el|
      wine_pairing_block = el.text.strip
      bottle.wine_pairing = wine_pairing_block.split(':').last
    end

    #récupération du prix
    # html_doc_bottle.search('.prix-wrapper').each do |el|
    #   bottle.price = el.search(".price").text.strip
    # end
    bottle.price = rand(7..59)

    # récupération des descriptions
    bottle_details = {}
    html_doc_bottle.search('.descriptions .row').each do |el|
      bottle_details[el.search('.features-label').text.strip] = el.search('.features-value').text.strip
    end

    # Attribution des paramètres de chaque bouteille
    if Winery.find_by(name: bottle_details["Domaine :"])
      bottle.winery = Winery.find_by(name: bottle_details["Domaine :"])
    else
      winery = Winery.create(name: bottle_details["Domaine :"])
      bottle.winery = winery
    end

    bottle.color = rouge if bottle_details["Couleur :"].split(' ').last == "rouge"
    bottle.color = blanc if bottle_details["Couleur :"].split(' ').last == "blanc"
    bottle.color = rose if bottle_details["Couleur :"].split(' ').last == "rosé"
    bottle.color = effervescent if bottle_details["Couleur :"].split(' ').last == "effervescent"

    if bottle_details["Nom du vin :"]
      bottle.title = bottle_details["Nom du vin :"]
    else
      bottle.title = html_doc_bottle.search('.page-header h1').text.strip
    end

    bottle.year = bottle_details["Millésime :"].to_i

    bottle.designation = bottle_details["Appellation :"]
    if Region.find_by(name: bottle_details["Région :"])
      bottle.region = Region.find_by(name: bottle_details["Région :"].downcase.capitalize)
    else
      bottle.region = france
    end
    bottle.grapes = bottle_details["Cépages :"]
    bottle.terroir = bottle_details["Terroirs :"]
    bottle.harvest = bottle_details["Vendanges :"]
    bottle.viticulture = bottle_details["Viticulture :"]
    bottle.winemaking = bottle_details["Vinification :"]
    if bottle_details["Degré d'alcool :"]
      bottle.alcool = bottle_details["Degré d'alcool :"].split('\n').join
    end
    bottle.nose = bottle_details["Nez :"]
    bottle.bio = true if bottle_details["Vin Bio :"] == "Oui"
    bottle.appearance = bottle_details["Oeil :"]
    bottle.taste = bottle_details["Bouche :"]
    bottle.best_before = bottle_details["Boire avant :"]
    bottle.best_after = bottle_details["Boire à partir de :"]
    if bottle_details["Ouvrir :"] && bottle_details["Servir :"]
      bottle.tasting_advice = "Ouvrir " + bottle_details["Ouvrir :"] + " et servir " + bottle_details["Servir :"].downcase
    elsif bottle_details["Servir :"]
      bottle.tasting_advice = " Servir " + bottle_details["Servir :"].downcase
    elsif bottle_details["Ouvrir :"]
      bottle.tasting_advice = "Ouvrir " + bottle_details["Ouvrir :"]
    end
    bottle.save!
  end
end
puts "bottles created !"


