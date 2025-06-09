// On a 2D plane, there are n points with integer coordinates points[i] = [xi, yi]. 
// Return the minimum time in seconds to visit all points in order given by points.
//  You can move according to the following rules:
// In 1 second, you can either:
// - move vertically by one unit,
// - move horizontally by one unit, or
// - move diagonally (in a straight line) by one unit (which means moving vertically and horizontally by one unit at the same time).

// You have to visit the points in the same order as they are given.
// You are allowed to pass through points appear later in the order, but these do not count as visited.


// Input: points = [[1,1],[3,4],[-1,0]]
// Output: 7
// Explaination: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0].
//Time from [1,1] to [3,4] takes 3 seconds.
// Time from [3,4] to [-1,0] takes 4 seconds.
// Total time = 7 seconds.

//Constraints:
// points.length == n


// Ans Explaination:
// the min time to visit all points is determined by the maximum of the horizontal and vertical distances between consecutive points.


// Time complexity: O(n), where n is the number of points.
// Space complexity: O(1), since we are using a constant amount of space.


func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
    guard points.count > 1 else { return 0 }

    var totalTime = 0

    for i in 1..<points.count {
        let xDiff = abs(points[i][0] - points[i - 1][0])
        let yDiff: Int = abs(points[i][1] - points[i - 1][1])
        totalTime += max(xDiff, yDiff)
    }

    return totalTime
}


// Example usage:
let points = [[1, 1], [3, 4], [-1, 0]]
let time = minTimeToVisitAllPoints(points)
print(time)  // Output: 7