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
    @pixel.each_with_index do |row, rowIndex| #find rowIndex
      row.each_with_index do |col, colIndex| #find colIndex
        if col == 1
          pixel_location << [rowIndex, colIndex]
        end
      end
    end
    pixel_location.each do |row, col|
      @pixel[row-1][col] = 1 unless row == 0               #up
      @pixel[row+1][col] = 1 unless row == @pixel.length-1 #down
      @pixel[row][col-1] = 1 unless col == 0               #left
      @pixel[row][col+1] = 1 unless col == @pixel.length-1 #right
    end
  end
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur_image
image.output_image