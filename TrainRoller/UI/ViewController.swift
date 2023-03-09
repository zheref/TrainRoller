import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var exercisesTableView: UITableView!
        
    // Se crea una instancia de WorkoutManager (Core)
    var manager = WorkoutManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.tintColor = .black
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
        setup()
    }
    
    func setup() {
        manager.add(workout: Workout(name: "Biceps Curl", reps: 12, sets: 4, muscle: .biceps, restSeconds: 30))
        manager.add(workout: Workout(name: "Push Up", reps: 15, sets: 4, muscle: .chest, restSeconds: 30))
        manager.add(workout: Workout(name: "Squats", reps: 20, sets: 4, muscle: .cuadriceps, restSeconds: 30))
        manager.add(workout: Workout(name: "Triceps Kickback", reps: 15, sets: 4, muscle: .triceps, restSeconds: 30))
        manager.add(workout: Workout(name: "Flys", reps: 10, sets: 4, muscle: .shoulders, restSeconds: 30))
        manager.add(workout: Workout(name: "Remo", reps: 12, sets: 4, muscle: .back, restSeconds: 30))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func userDidTapAdd(_ sender: UIBarButtonItem) {
        print("Hola ADD ☺️")
    }

    // Metodos del TableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.workouts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "exerciseCell")
        let exercise = manager.workouts[indexPath.row]
        cell.textLabel?.text = exercise.name
        return cell
    }
    // Suscripción al evento de selección de celdas.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "ExersiceDetails") as? DetailsViewController
        let exersiceSelected = manager.workouts[indexPath.row]
        detailsController?.model = exersiceSelected
        
        navigationController?.pushViewController(detailsController!, animated: true)
    }
}
