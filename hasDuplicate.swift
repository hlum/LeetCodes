
func hasDuplicate(_ nums: [Int]) -> Bool {
    let set = Set<Int>(nums)
    return set.count != nums.count
}


let arrary1: [Int] = [1, 2, 3, 4, 5]
let arrary2: [Int] = [1, 2, 3, 4, 5, 5]

print(hasDuplicate(arrary1))
print(hasDuplicate(arrary2))
