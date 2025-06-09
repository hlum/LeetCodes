
// Question 1: Duplicate Values

// Given an integer arrary nums, return true if any value appears **at least twice** in the array, and return ==false== if every element is distinct.


// Example 1:

// Input : nums = [1,2,3,1]
// Output: true


// Space Time Complexity:
// Time Complexity: O(n)
// Space Complexity: O(n)
func hasDuplicate(_ nums: [Int]) -> Bool {
    let set = Set<Int>(nums)
    return set.count != nums.count
}


let arrary1: [Int] = [1, 2, 3, 4, 5]
let arrary2: [Int] = [1, 2, 3, 4, 5, 5]

print(hasDuplicate(arrary1))
print(hasDuplicate(arrary2))
