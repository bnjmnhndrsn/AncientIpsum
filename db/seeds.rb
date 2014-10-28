require 'json'

quotes = JSON.parse(File.read('./lib/assets/quotes.json'))
quotes["data"].each do |quote|
  Quote.create!(quote)
end