puts "Hello"
def find_letter(number, index, string)
  h = {
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }
  h[number[index].to_i].each do |letter|
    if (number.size - 1) == index
      puts "#{string}#{letter}"
    else
      find_letter(number, index + 1, "#{string}#{letter}")
    end
  end
end

number = "2282668687"
find_letter(number, 0, "")