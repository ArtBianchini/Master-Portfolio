class Image
attr_accessor :data

def initialize(data)
	@data = data
end

def blur
  # bad code
  return Image.new(@data)
  end
end 