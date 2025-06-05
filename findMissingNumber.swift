/// Finds the missing number in a sequence of numbers within a given range
/// - Parameters:
///   - nums: Array of numbers that may be missing one number from the range
///   - range: The range of numbers to check against (e.g., 0..<10 for numbers 0 through 9)
/// - Returns: The missing number from the sequence
/// - Precondition: The range must be valid and nums must contain all numbers from the range except one

// Time complexity: O(n)
// Space complexity: O(1)

// explanation:
// we can use the formula for the sum of an arithmetic series to find the missing number
// the formula is: sum = n/2 * (first + last)
// we can use this to find the sum of the expected numbers and the sum of the actual numbers
// the difference between the two sums is the missing number

func findMissingNumber(_ nums: [Int], range: Range<Int>) -> Int {

    guard !range.isEmpty else { return 0 }
    
    var expectedNumsTotal = 0
    for i in range { 
        expectedNumsTotal += i
    }
    
    var actualNumsTotal = 0
    for num in nums {
        actualNumsTotal += num
    }
    
    return expectedNumsTotal - actualNumsTotal
}

// Test case
let range = 0..<10
let nums = [0,1,2,3,4,5,6,7,9]
print("The missing number is: \(findMissingNumber(nums, range: range))")