require 'rest-client'

When /^I send a GET request to (.*) resource$/ do |res|
  puts 'check connectivity'
  @response = RestClient.get "https://api.hh.ru/#{res}"
  #puts @response.body
end

Then /^I should get valid list of areas$/ do
  validate_list(@response.body, of: 'area')
end
