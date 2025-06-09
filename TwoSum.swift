

func getAllTwoSums(_ nums: [Int], _ target: Int) -> [(Int, Int)] {
    var seen: [Int: Int] = [:]
    var results: [(Int, Int)] = []


    for (index, value) in nums.enumerated() {
        let complement = target - value
        if let matchIndex = seen[complement] {
            results.append((matchIndex, index))
        }

        seen[value] = index
    }

    return results
}


// getting only one pair
func getTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexMap: [Int: Int] = [:]
    
    for (index, value) in nums.enumerated() {
        let diff = target - value
        if let foundIndex = indexMap[diff] {
            return [foundIndex, index]
        }
        indexMap[value] = index
    }

    return []
}


// Example usage:
let nums = [3,4,2,1,5]
let target = 6
let indices = getTwoSum(nums, target)
indices.forEach { print("\($0)") }