And /^http status of the response should be (\d+)$/ do |status|
  expect(@response.code==status.to_i).to be_truthy
end

When /^I send a GET request to (.*) resource with area id (\d*) and text (.*)$/ do |res, id, text|
  @response = RestClient.get "https://api.hh.ru/#{res}", {params: {id: id.to_i, 'text' => "#{text}"}}
end

Then /^the length of found items array should equal to the "found" value$/ do
  body_hash=ActiveSupport::JSON.decode(@response.body)
  f= found(body_hash)
  num=items_num(body_hash)
  expect(f.to_i).to eq num
end

And /^the response should contain (\d+) items?$/ do |how_many|
  body_hash=ActiveSupport::JSON.decode(@response.body)
  f= found(body_hash)
  expect(f.to_i).to eq how_many.to_i
end

And /^the (.*) of item should be (.*)$/ do |classname, what|
  name=apply_path("$..#{classname}",@response.body)[0]
  expect(normalize_string name).to eq(normalize_string what)
end
