import Foundation

class WorkoutManager {

    var workouts = [Workout]()

    func add(workout: Workout) {
        workouts.append(workout)

        // Encode, Decode

        do {
            // Preparamos datos serializados
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(workouts)

            // Determinamos donde guardar el archivo
            let documentsURL = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first!

            let fileURL = documentsURL.appendingPathComponent("workout.json")

            // Guardar datos en archivo
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("There was an error: \(error)")
        }
    }

    func restore() {
        // Determinamos donde deberia estar el archivo
        let documentsURL = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        let fileURL = documentsURL.appendingPathComponent("workout.json")

        print("Reading content from URL: \(fileURL.absoluteString)")

        do {
            // Leemos contenido de archivo
            let data = try Data(contentsOf: fileURL)

            // Deserializar datos
            let decoder = JSONDecoder()
            let workouts = try decoder.decode([Workout].self, from: data)

            // Instalamos datos
            self.workouts = workouts
        } catch {
            print("There was an error reading data back: \(error)")
        }
    }

    func delete(position: Int) {
        workouts.remove(at: position)
    }


//    func suma(num1: Int, num2: Int) -> Int {
//        return num1 + num2
//    }

}


