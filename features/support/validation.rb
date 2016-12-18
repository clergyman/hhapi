module LocalHelpers

  def normalize_string(str)
    UnicodeUtils.downcase str.squeeze(" ")
  end
  
  def parse_args(str)
    #puts "starting to parse #{str}"
    params = {}
    str=str.squeeze(" ").split(" and ").each do |pair|
      pair=pair.split(" ", 2) #split by 1st space
      if (pair[1]) then params[pair[0]]=pair[1] end
    end
    
    #puts "#{params}"
    return params
  end
  
  def validate_list(response, of: nil, count: nil)
	#puts response  
	expect(response).to be_a_kind_of(Array)
	expect(response.size >0).to be_truthy

	unless of.nil?
	  validate_item = "validate_#{of.downcase.tr(' ', '_')}".to_sym
	  response.each { |item| send(validate_item, item) }
	end
  end

  def validate_area(area_hash)
    #puts "validating id #{area_hash["id"]}" if area_hash["name"].include?("Россия")
    expect(((area_hash["id"]=~/[1-9][0-9]*/))==0).to be_truthy
    expect(area_hash["name"]).to_not be_empty
    if (area_hash["parent_id"]) then
      expect(((area_hash["parent_id"]=~/[1-9][0-9]*/))==0).to be_truthy
    end
    if (area_hash["areas"].size>0) then
      #puts 'validation of deeper level! look out for recursion'
      validate_list(area_hash["areas"], of: 'area')
    end
  end
  
  def apply_path(path, input)
    JsonPath.on(input.to_s,path)
  end
  
  def found(response)
    puts "received parameter"
    response["found"]
  end
  
  def items_num(response)
    response["items"].size
  end
  

end

World(LocalHelpers)


