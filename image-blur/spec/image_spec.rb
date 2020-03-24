require 'spec_helper'
RSpec.describe Image, type: :model do
  class Image 
  def initialize(image)
    @image = image
  end 

   def output_image 
    @image.each do |arr|
      puts arr. join
   end
  end 

  def blur
    # copy of the current image 
  #copy = @image this is shallow copy.
  # this is a deep copy. 
    copy = Marshal.load( Marshal.dump(@image) )

    # loop over the original image , update the copy's neighbors of 1s to 1s 
    @image.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        if item == 1 
          if row_index != 0 # only update if upstairs neighbors exist
            copy[row_index - 1][column_index] = 1 #up
          end 
          if row_index !=  @image.length - 1 #only update if downstairs neighbors exist
            copy[row_index + 1][column_index] = 1 #down
          end 
          if column_index != 0 # only update if left neighbors exist
            copy[row_index][column_index - 1] = 1 #left
          end 
          if column_index != row.length - 1 # only update if right neighbors exist
            copy[row_index][column_index + 1] = 1 #right
          end
        end    # find if the item is a 1 then change it is neighbors
      end
    end 
    @image = copy 
  end 
  def blur_multiple num
    num.times do 
      blur
    end 
  end 
end


  image = Image.new([

    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [1, 1, 1, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 0]
])
image.blur_multiple 2
image.output_image
end 

