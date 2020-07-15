class Solution {
    func numTrees(_ n: Int) -> Int {
        var array = [1,1];
        if (n > 1) {
            for index in 2 ... n {
                for subIndex in 1 ... index {
                    if (array.count < index + 1) {
                        array.append(array[subIndex-1] * array[index-subIndex]);
                    } else {
                       array[index] += array[subIndex-1] * array[index-subIndex];
                    }
                }
            }
        }
        return array[n];
    }
}

let object = Solution();
var result = object.numTrees(15);
