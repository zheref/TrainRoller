import Foundation

// TEST DRIVEN DEVELOPMENT

enum MuscleType {
    case biceps
    case back
    case chest
    case shoulders
    case thighs
    case calfs
    case glutes
    case core
    case trapezoid
    case triceps
    case cuadriceps
}


struct Workout: Equatable {
    let name: String
    var reps: Int
    var sets: Int
    var muscle: MuscleType
    var restSeconds: Int
}

class WorkoutManager {

    var workouts = [Workout]()

    func add(workout: Workout) {
        workouts.append(workout)
    }

    func delete(position: Int) {
        workouts.remove(at: position)
    }


//    func suma(num1: Int, num2: Int) -> Int {
//        return num1 + num2
//    }

}


