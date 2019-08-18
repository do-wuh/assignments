module Luhn
  def self.is_valid?(number)
    number = number.to_s.each_char.to_a.map!{ |i| i.to_i }.reverse!
    number.map!.each_with_index { |n,i| i.odd? ? n *= 2 : n = n }
    number.map!.each_with_index { |n,i| i.odd? ? n >= 10 ? n -9 : n = n : n = n }
    sum = 0
    number.each{ |i| sum += i }
    number = sum
    number % 10 == 0
  end
end