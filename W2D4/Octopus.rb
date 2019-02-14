#sluggish octopus O(n^2)

def sluggish_sort(arr)
    sort = false
    until sort
        sort = true
        i = 0
        while i < arr.size - 1
            if arr[i].length > arr[i + 1].length
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            sort = false
            end
            i +=1
        end
    end
    arr.last
end

def dominant_sort(arr)
    return arr if arr.size < 2
    prc = proc {|x,y| x <=> y}

    mid = arr.size / 2
    left = arr.take(mid)
    right = arr.drop(mid)

    left_sorted = dominant_sort(left)
    right_sorted = dominant_sort(right)
    
    merge(left_sorted, right_sorted, &prc)
    
end

def merge(arr1, arr2, prc)
    result = []
    until arr1.empty? || arr2.empty?
        case prc.call(arr1.first, arr2.first)
        when -1, 0
            result << arr1.shift
        when 1
            result << arr2.shift
        end
        
    end
    result + arr1 + arr2
end

def clever_sort(arr)
    max = nil
    arr.each do |fish|
        if max.nil? || fish.size > max.size
            max = fish
        end

    end
    max
end


# def dancing_octopus
TILE ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dir, TILE)
    TILE.each_with_index do |dirr, i|
        if dirr == dir
            return i
        end
    end
end

TILES = {
    "up" => 0, 
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5,
    "left" => 6,  
    "left-up" => 7
}
def constant_dance(dir, TILES)
    TILES[dir]
end




