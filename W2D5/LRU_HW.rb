
class LRUCache
    attr_reader :max
    attr_accessor :queue
    I = 0
    def initialize(size)
        @max = size
        @queue = Hash.new{|h,k| h[k]}
    end

    def count
      queue.size
    end

    def add(el)
        if queue[el]
            queue.delete(el)
            queue[el] = I
            I += 1
        elsif count < max
            queue[el] = I
            I += 1
        else
            queue.delete(queue.keys[0])
            queue[el] = I
            I += 1
        end

    end

    def show
      print queue
      puts
    end

    private
    # helper methods go here!

  end