Given /^I send a GET request to (.*) resource with (.+?)$/ do |res, args|
  para = parse_args args
  @response = RestClient.get "https://api.hh.ru/#{res}", {params: para}
  #puts @response.body
end

And /^http status of the response should be (\d+)$/ do |status|
  expect(@response.code==status.to_i).to be_truthy
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

And /^the response should contain at least (\d+) items?$/ do |how_many|
  body_hash=ActiveSupport::JSON.decode(@response.body)
  f= found(body_hash)
  expect(f.to_i>=how_many.to_i).to be_truthy 
end

And /^the (.*) of item should exactly match (.*)$/ do |classname, what|
  name=apply_path("$..#{classname}",@response.body)[0]
  expect(normalize_string name).to eq(normalize_string what)
end

And /^the (.*) of item should be like (.*)$/ do |classname, what|
  name_from_response=normalize_string (apply_path("$..#{classname}",@response.body)[0])
  name_from_test_data=normalize_string what
  expect(name_from_response.include?(name_from_test_data)).to be_truthy
end
