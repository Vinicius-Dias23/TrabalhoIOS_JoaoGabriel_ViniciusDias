

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var celularArray: [Celular] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        downloadApi()
    }

    private func downloadApi() {
        let link = URL(string: "https://apiwlad.herokuapp.com/")!
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let data = data {
                do {
                    let celularApi = try JSONDecoder().decode([Celular].self, from: data)
                    
                    self.celularArray.append(contentsOf: celularApi)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Erro de parse")
                }
            }
        }.resume()
    }
    
    func downloadImage(with url: String,  completion: @escaping(UIImage?) -> ()) {
        if let link = URL(string: url) {
            URLSession.shared.dataTask(with: link) { (data, response, error) in
                if let data = data {
                    let uiImage = UIImage(data: data)
                    DispatchQueue.main.async {
                        completion(uiImage)
                    }
                }
            }.resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailCelularViewController, let celular = sender as? Celular {
            viewController.celular = celular
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celularArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celularCell", for: indexPath) as? CelularViewCell {
            let celular = celularArray[indexPath.row]
            cell.celularName.text = celular.name
            cell.celularBrand.text = celular.brand
            cell.celularPrice.text = String(celular.value)
            
            downloadImage(with: celular.image) { (image) in
                cell.celularImage.image = image
            }            
            
            return cell
        } else {
            fatalError("Não foi possivel convertar a celula.")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let celular = celularArray[indexPath.row]
        performSegue(withIdentifier: "segueDetail", sender: celular)
    }
}
