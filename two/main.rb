passwords = File.readlines('passwords.txt', chomp: true).map do |password|
  data = password.split(":").map(&:strip)
  keys = ['schema', 'password']
  keys.zip(data).to_h
end

def count_valid_passwords(passwords)
  valid = 0

  passwords.each do |password|
    schema = password['schema'].split(' ')
    range = schema[0].split('-').map(&:to_i)
    count = password['password'].count(schema[1])

    valid += 1 if count.between?(range[0], range[1])
  end

  return valid
end

def count_valid_passwords_v2(passwords)
  valid = 0

  passwords.each do |password|
    schema = password['schema'].split(' ')
    positions = schema[0].split('-').map(&:to_i)
    first_position = positions[0] - 1
    second_position = positions[1] - 1
    letter = schema[1]
    password = password['password']

    valid +=1 if (password[first_position] == letter) != (password[second_position] == letter)
  end

  return valid
end

def letter_in_first_position?(position, letter, password)
  password[position] == letter
end

def letter_in_second_position?(position, letter, password)
  password[position] == letter
end

puts passwords.count
puts count_valid_passwords(passwords)

puts count_valid_passwords_v2(passwords)
