class Stack
    attr_accessor :ivar
    def initialize
        @ivar = []

    end

    def push(el)
        @ivar << el
    end

    def pop
        @ivar.pop

    end

    def peek
        @ivar[-1]
    end


end

