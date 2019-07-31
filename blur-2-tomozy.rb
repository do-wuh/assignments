class Image
  
  def initialize(pixel)
    @pixel = pixel
  end 

  def output_image
    @pixel.each do |row|
        puts row.join(" ")
    end
  end

  def blur_image
    pixel_location = []
    @pixel.each_with_index do |row, rowIndex|
      row.each_with_index do |col, colIndex|
        if col == 1
          pixel_location << [rowIndex, colIndex]
        end        
      end      
    end    
    pixel_location.each do |row, col|
      @pixel[row-1][col] = 1 unless row == 0
      @pixel[row+1][col] = 1 unless row == @pixel.length-1
      @pixel[row][col-1] = 1 unless col == 0
      @pixel[row][col+1] = 1 unless col == @pixel[row].length-1
    end
  end
  
end

image = Image.new([
  [0, 0, 0, 1, 0],
  [1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0]
])

image.blur_image
image.output_image