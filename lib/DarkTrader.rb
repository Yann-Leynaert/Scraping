require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

currencies = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
arr_currencies = currencies.map{|currency| currency.text}

prices = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//td [@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
arr_prices = prices.map{|price| price.text.delete("$").to_f}

my_array=[]

arr_currencies.each_with_index do |value,index|
  my_hash = Hash.new
  my_hash[value] = arr_prices[index]
  my_array << my_hash
end
puts my_array
