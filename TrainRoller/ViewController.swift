import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var exercisesTableView: UITableView!

    var exercises: [String] = [
        "Biceps Curl",
        "Burpees",
        "Squats",
        "Triceps Kickback"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.tintColor = .black
        exercisesTableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func userDidTapAdd(_ sender: UIBarButtonItem) {
        print("Hola ADD ☺️")
    }

    // Metodos del TableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "exerciseCell")
        let exercise = exercises[indexPath.row]
        cell.textLabel?.text = exercise
        return cell
    }
}
