import Foundation

enum MuscleType: Codable {
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


struct Workout: Equatable, Codable {
    let name: String
    var reps: Int
    var sets: Int
    var muscle: MuscleType
    var restSeconds: Int
}
