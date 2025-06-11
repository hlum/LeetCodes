
// MARK: Method 1: Sorting + Dictionary Mapping
// ✅ Time complexity: O(n log n)
// ✅ Space complexity: O(n)
//
// ✅ Pros:
// - Works with any integers (including negatives and large values).
// - Simple, clean logic.
//
// ❌ Cons:
// - Slower than the counting approach due to sorting overhead.

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



// MARK: Method 2: Counting + Prefix Sum (Supports Negatives)
// ✅ Time complexity: O(n + k), where k = max(nums) - min(nums)
// ✅ Space complexity: O(n + k)
//
// ✅ Pros:
// - Very fast when value range is small.
// - Linear time (no sorting).
// - Now supports negative numbers (via normalization).
//
// ❌ Cons:
// - Memory usage grows with number range (not optimal for large min–max span).

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else { return [] }

    let minValue = nums.min()!
    let maxValue = nums.max()!
    let rangeSize = maxValue - minValue + 2

    var counts = Array(repeating: 0, count: rangeSize)

    for num in nums {
        counts[num - minValue + 1] += 1
    }

    for i in 1..<counts.count {
        counts[i] += counts[i - 1]
    }

    return nums.map { counts[$0 - minValue] }
}



// | Criteria                    | Sorting + Map (`GetSmallerCount`) | Counting + Prefix (`smallerNumbersThanCurrent`)    |
// | --------------------------- | --------------------------------- | -------------------------------------------------- |
// | 🧠 Simplicity               | ✅ Easy to understand              | 🔶 Slightly trickier, but still readable           |
// | ⚡ Speed (small range)       | ❌ Slower (due to sort)            | ✅ Very fast `O(n + k)`                             |
// | 🌍 Supports negative values | ✅ Yes                             | ✅ Yes (with normalization)                         |
// | 🔢 Handles large values     | ✅ Yes                             | ❌ No — memory grows with value range               |
// | 💾 Memory usage             | ✅ Efficient (O(n))                | ❌ May be high if `max - min` is large (`O(n + k)`) |


// Example usage:
let nums = [8, 1, 2, 2, 3]
let smallerCounts = smallerNumbersThanCurrent(nums)
smallerCounts.forEach { print($0) }
// Output: 4, 0, 1, 1, 3