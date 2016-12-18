When /^I send a GET request to (.*) resource without parameters$/ do |res|
  @response = RestClient.get "https://api.hh.ru/#{res}"
  #puts @response.body
end

Then /^I should get valid list of areas$/ do
  validate_list(ActiveSupport::JSON.decode(@response.body), of: 'area')
end

When /^I send a GET request to (.*) resource with id (\d+)/ do |res, id|
 @response = RestClient.get "https://api.hh.ru/#{res}/#{id}"
end

Then /^I should get valid area details$/ do
  validate_area(ActiveSupport::JSON.decode(@response.body))
end

