DICTIONARY = File.readlines("/Users/kshitij/dev/tests/codechef/phone_number_to_word_in_dictionary/dictionary.txt").map { |w| w.chomp.downcase }.uniq
def find_letter(number, index, string, res, final_res, number_letters_hash)
  number_letters_hash[number[index].to_i].each do |letter|
    word = "#{string}#{letter}"
    if DICTIONARY.bsearch { |dw| word <=> dw }
      subset_arr = res.dup
      subset_arr << word
      find_letter(number, index + 1, "", subset_arr, final_res, number_letters_hash) if (number.size - 1) != index
      final_res << subset_arr if index == number.size - 1
    end

    if (number.size - 1) != index
      find_letter(number, index + 1, word, res, final_res, number_letters_hash)
    end
  end
end

def find_possible_words(number)
  final_res = []
  number_letters_hash = {
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }
  find_letter(number.to_s, 0, "", [], final_res, number_letters_hash)
  final_res
end

final_res = find_possible_words(2282668687)
final_res.each{ |x| puts "#{x.inspect}" }
puts "Result Count => #{final_res.size}"


