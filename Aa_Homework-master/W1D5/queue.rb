class Queue
    attr_accessor :line

    def initialize
        @line = []
    end

    def enqueue(x)
        self.line.push(x)
    end

    def dequeue
        self.line.shift
    end

    def peek
        self.line.first
    end
end