import UIKit

class MainController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        manager.restore()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // Creación y presentación de la nueva pantalla (new exersice)
    @IBAction func userDidTapAdd(_ sender: UIBarButtonItem) {
        print("Hola ADD ☺️")
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let newExersiceController = storyboard.instantiateViewController(withIdentifier: "NewExersiceController") as? NewExersiceController
        newExersiceController?.delegate = self
        
        present(newExersiceController!, animated: true)
    }
    // conexión de regreso con el nuevo view controller 
    func deliverNewExersice(newExersice: Workout) {
        manager.add(workout: newExersice)
        exercisesTableView.reloadData()
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
