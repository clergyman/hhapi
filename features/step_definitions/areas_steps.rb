require 'rest-client'

When /^I send a GET request$/ do
  puts 'check connectivity'
  response = RestClient.get 'https://api.hh.ru/areas'
  puts response
end
