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

// TAREA
// 1. Crear managers con pruebas unitarias para: Banco (cuenta, cliente)
//    Incluyendo metodos para: Abrir cuenta, cerrar cuenta, depositar dinero
// 2. Crear managers con pruebas unitarias para: Reporte de clima (incluyendo ciudades)
//    Incluyendo metodos para: Actualizar temperatura y variables por ciudad, agregar y eliminar ciudades
