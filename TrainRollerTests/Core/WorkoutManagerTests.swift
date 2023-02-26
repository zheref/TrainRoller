import XCTest
@testable import TrainRoller

final class WorkoutManagerTests: XCTestCase {

//    func testSuma() {
//        let manager = WorkoutManager()
//        XCTAssertEqual(
//            manager.suma(num1: 1, num2: 3),
//            4
//        )
//    }

    func createNewWorkout() -> Workout {
        Workout(name: "Biceps curl",
                reps: 12,
                sets: 3,
                muscle: .biceps,
                restSeconds: 30)
    }

    func testAdd() {
        let manager = WorkoutManager()

        // Expectation #1
        XCTAssert(manager.workouts.isEmpty)

        // Prueba
        let newWorkout = createNewWorkout()
        manager.add(workout: newWorkout)

        // Asserts!
        // Expectation #2
        XCTAssertEqual(manager.workouts.count, 1)
        // Expectation #3
        XCTAssertEqual(manager.workouts.first, newWorkout)
    }

    func testDelete() {
        // Preparation
        let manager = WorkoutManager()
        manager.add(workout: createNewWorkout())

        // Hacer uso de lo que vas a probar
        manager.delete(position: 0)

        // Assert! (verificar que las cosas hayan ocurrido tal cual esperabas)
        XCTAssertEqual(manager.workouts.count, 0)
    }

}



