class Map
    attr_accessor :dic

    def initialize
        @dic = []
    end

    def set(k,v)
        if self.dic.any?{|pair| pair[0] == k}
            self.dic.each do |pear|
                if pear[0] == k
                    pear[1] = v
                end
            end
        else
            self.dic << [k,v]
        end
    end

    def get(key)
        check = self.dic.select{|pair| pair[0] == key}
        check.length == 0 ? nil : check[0][1]
    end

    def delete(k)
        self.dic.each do |pair|
            if pair[0] == k
                self.dic.delete(pair)
            end
        end
    end

    def show
        self.dic
    end



end