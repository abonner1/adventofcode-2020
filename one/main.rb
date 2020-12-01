number_list = File.readlines('input.txt', chomp: true).collect(&:to_i)

def two_numbers(number_list)
  return if number_list.empty?
  number = number_list[0]
  number_list = number_list.drop(1)
  number_list.each_with_index do | v, i |
    if i < number_list.length - 1
      return number * v if number + v == 2020
    end
  end
  two_numbers(number_list)
end

def three_numbers(number_list)
  return if number_list.empty?

  number = number_list[0]
  number_list = number_list.drop(1)

  number_list.each_with_index do |v, i|
    number_list.drop(1).each_with_index do |v2, i2|
      return number * v * v2 if number + v + v2 == 2020
    end
  end

  three_numbers(number_list)
end
