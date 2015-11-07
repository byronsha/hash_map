class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_num = 0.hash
    self.each_with_index do |number, idx|
      hash_num = hash_num ^ (number.hash + idx)
    end
    hash_num
  end
end

class String
  def hash
    hash_num = 0
    alphabet = ("a".."z").to_a
    self.split("").each_with_index do |char, idx|
      hash_num = hash_num ^ (alphabet.index(char.downcase) + idx).hash
    end
    hash_num
  end
end

class Hash
  def hash
    hash_array = self.to_a.flatten
    new_hash_array = []
    hash_array.each do |el|
      if el.is_a?(Symbol)
        new_hash_array << el.to_s
      else
        new_hash_array << el
      end
    end

    hash_num = 0

    hash_array.each do |el|
      hash_num = hash_num ^ el.hash
    end
    hash_num
  end
end
