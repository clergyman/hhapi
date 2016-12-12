require 'active_support'

module LocalHelpers

  
  def validate_list(data, of: nil, count: nil)
	  
	response = ActiveSupport::JSON.decode(data)
	expect(response).to be_a_kind_of(Array)
	expect(response.size >0).to be_truthy

	unless of.nil?
	  validate_item = "validate_#{of.downcase.tr(' ', '_')}".to_sym
	  response.each { |item| send(validate_item, item) }
	end
  end

  def validate_area(area_hash)
    #puts "validating id #{area_hash["id"]}"
    expect((area_hash["id"]=~/[1-9][0-9]*/)==0).to be_truthy
    expect(area_hash["name"]).to_not be_empty
    if (area_hash["parent_id"]) then
      expect((area_hash["parent_id"]=~/[1-9][0-9]*/)==0).to be_truthy
    end
    if (area_hash["areas"].size>0) then
      #puts 'validation of deeper level! look out for recursion'
      validate_list("#{ActiveSupport::JSON.encode(area_hash["areas"])}", of: 'area')
    end
  end
end

World(LocalHelpers)


