import Foundation


public func problem1(_ S : inout String, _ K : Int) -> String {
    // write your code in Swift 4.2.1 (Linux)
    let days: [String: Int] = ["Mon": 0,
                               "Tue": 1,
                               "Wed": 2,
                               "Thu": 3,
                               "Fri": 4,
                               "Sat": 5,
                               "Sun": 6]
    
    let KDaysLater = ((days[S] ?? 0) + K) % 7
     
    return days.filter {$0.value == KDaysLater}.keys.first ?? ""
}

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
 

public func problem2(_ P : inout [Int], _ S : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var numberOfCars: Int = 0
    var peopleCount = P.reduce(0) { $0 + $1 }
    
    S = S.sorted(by: {$0 > $1})
    
    for (index, carSeats) in S.enumerated() {
        peopleCount -= carSeats
        
        if peopleCount <= 0 {
            numberOfCars = index+1
            break
        }
    }
    
    return numberOfCars
}

