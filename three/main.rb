map = File.readlines('map.txt', chomp: true)

def count_the_trees(map, across, down)
  trees = 0
  index = 0
  times_duplicated = 1
  row = down

  map.drop(down).each do |line|
    if row % down == 0
      index += across

      if index > line.length
        times_duplicated += 1
        line *= times_duplicated
      end

      trees += 1 if line[index] == '#'
    end

    row += 1
  end

  return trees
end

puts count_the_trees(map, 1, 1)
puts count_the_trees(map, 3, 1)
puts count_the_trees(map, 5, 1)
puts count_the_trees(map, 7, 1)
puts count_the_trees(map, 1, 2)

puts count_the_trees(map, 1, 1) * count_the_trees(map, 3, 1) * count_the_trees(map, 5, 1) * count_the_trees(map, 7, 1) * count_the_trees(map, 1, 2)

# ['..##.......',
# '#...#...#..',
# '.#....#..#.',
# '..#.#...#.#',
# '.#...##..#.',
# '..#.##.....',
# '.#.#.#....#',
# '.#........#',
# '#.##...#...',
# '#...##....#',
# '.#..#...#.#']
