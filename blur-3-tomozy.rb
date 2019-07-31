class Image
  
  def initialize(pixel)
    @pixel = pixel
  end 

  def output_image
    @pixel.each do |row|
        puts row.join(" ")
    end
  end

  def blur_pixel
    pixel_location = []
    @pixel.each_with_index do |row, rowIndex|
      row.each_with_index do |col, colIndex|
        if col == '■'
          pixel_location << [rowIndex, colIndex]
        end        
      end      
    end    
    pixel_location.each do |row, col|
      @pixel[row-1][col] = '■' unless row == 0
      @pixel[row+1][col] = '■' unless row == @pixel.length-1
      @pixel[row][col-1] = '■' unless col == 0
      @pixel[row][col+1] = '■' unless col == @pixel[row].length-1
    end
  end

  def blur (distance)
    (1..distance).each do |distance|
      blur_pixel
    end
  end

  def prompt(distance)
    print(distance)
    gets.to_i
  end

end

image = Image.new([
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '■', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '□'],
  ['□', '□', '□', '□', '□', '□', '□', '□', '■']
])

image.output_image
puts
distance = image.prompt "Enter blur distance: "
puts
image.blur(distance)
image.output_image