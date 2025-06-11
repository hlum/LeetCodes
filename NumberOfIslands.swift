/*
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
// Example 1:
// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1
// Example 2:
// Input: grid = [
//   ["1","1","0","0","0"],
//   ["1","1","0","0","0"],
//   ["0","0","1","0","0"],
//   ["0","0","0","1","1"]
// ]
// Output: 3
// Constraints:
// m == grid.length
// n == grid[i].length
// 1 <= m, n <= 300
// grid[i][j] is '0' or '1'.
// Approach: Depth-First Search (DFS)

*/


func numOfIslands(_ grid: [[Character]]) -> Int {
    guard !grid.isEmpty, !grid[0].isEmpty else { return 0 }
    var grid = grid // Create a mutable copy of the grid
    var islandCount = 0
    let rows = grid.count
    let cols = grid[0].count

    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == "1" { // Found an island
                islandCount += 1
                dfs(r, c)
            }
        }
    }

    return islandCount

    func dfs(_ r: Int, _ c: Int) {
        // Check for out of bounds or water and visit status
        if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] == "0" {
            return
        }
        grid[r][c] = "0" // Mark the land as visited

        // mark the land as visited if it is part of the island
        dfs(r-1, c) // Up
        dfs(r+1, c) // Down
        dfs(r, c+1) // Right
        dfs(r, c-1) // Left
    }

    
}

// Example usage:
let grid: [[Character]] = [
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"]
]

print("Number of islands: \(numOfIslands(grid))") // Output: 1
let grid2: [[Character]] = [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
]
print("Number of islands: \(numOfIslands(grid2))") // Output: 3
// Example usage with an empty grid
let emptyGrid: [[Character]] = []
print("Number of islands in empty grid: \(numOfIslands(emptyGrid))") // Output: 0
// Example usage with a grid containing only water
let waterGrid: [[Character]] = [
    ["0", "0", "0"],
    ["0", "0", "0"],
    ["0", "0", "0"]
]
print("Number of islands in water grid: \(numOfIslands(waterGrid))") // Output: 0
// Example usage with a grid containing only one island
let singleIslandGrid: [[Character]] = [
    ["1", "1", "1"],
    ["1", "0", "1"],
    ["1", "1", "1"]
]
print("Number of islands in single island grid: \(numOfIslands(singleIslandGrid))") // Output: 1
// Example usage with a grid containing multiple islands
let multipleIslandsGrid: [[Character]] = [
    ["1", "0", "1", "0"],
    ["0", "0", "0", "1"],
    ["1", "0", "1", "0"],
    ["0", "1", "0", "1"]
]
print("Number of islands in multiple islands grid: \(numOfIslands(multipleIslandsGrid))") // Output: 5
// Example usage with a grid containing islands of different shapes
let variedIslandsGrid: [[Character]] = [
    ["1", "1", "0", "0", "1"],
    ["1", "0", "0", "1", "1"],
    ["0", "0", "1", "0", "0"],
    ["0", "1", "1", "0", "1"]
]
print("Number of islands in varied islands grid: \(numOfIslands(variedIslandsGrid))") // Output: 5
// Example usage with a grid containing islands touching edges
let edgeTouchingIslandsGrid: [[Character]] = [
    ["1", "1", "0", "0"],
    ["1", "0", "0", "1"],
    ["0", "0", "1", "1"],
    ["0", "1", "1", "0"]
]
print("Number of islands in edge touching islands grid: \(numOfIslands(edgeTouchingIslandsGrid))") // Output: 4
