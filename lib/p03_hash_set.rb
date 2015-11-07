require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    key_hash = key.hash
    @store[key_hash % num_buckets] << key
    @count += 1
  end

  def include?(key)
    key_hash = key.hash
    @store[key_hash % num_buckets].include?(key)
  end

  def remove(key)
    key_hash = key.hash
    @store[key_hash % num_buckets].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |num|
      new_store[num % new_store.length] << num
    end
    @store = new_store
  end
end
