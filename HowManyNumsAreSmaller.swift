
// time complexity: O(n log n)
// Space complexity: O(n)

func GetSmallerCount(_ nums: [Int]) -> [Int] {
    let sortedNums = nums.sorted()

    var result: [Int: Int] = [:]

    for (index, value) in sortedNums.enumerated() {
        if result[value] == nil {
            result[value] = index
        }
    }

    return nums.map { result[$0, default: 0] }
}


// // Example usage:
// let nums = [8, 1, 2, 2, 3]
// let smallerCounts = GetSmallerCount(nums)
// smallerCounts.forEach { print($0) }
// // Output: 4, 0, 1, 1, 3

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var count = Array(repeating: 0, count: nums.max()! + 2)

    // Step 1: Count frequency with offset
    for num in nums {
        count[num + 1] += 1
    }

    // Step 2: Prefix sum
    for i in 1..<nums.max()! + 1 {
        count[i] += count[i - 1]
    }

    // Step 3: Build result
    return nums.map { count[$0] }
}
// Example usage:
let nums = [8, 1, 2, 2, 3]
let smallerCounts = smallerNumbersThanCurrent(nums)
smallerCounts.forEach { print($0) }
// Output: 4, 0, 1, 1, 3