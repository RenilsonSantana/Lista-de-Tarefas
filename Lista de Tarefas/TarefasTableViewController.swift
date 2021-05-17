//
//  ViewController.swift
//  Lista de Tarefas
//
//  Created by Renilson Santana on 17/05/21.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    // MARK: - Atributos
    
    var listaDeTarefas: Array<String> = []
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recuperaListaDeTarefas()
        tableView.reloadData()
    }
    
    // MARK: - Metodos
    
    func recuperaListaDeTarefas(){
        guard let tarefas = UserDefaults.standard.object(forKey: "listaDeTarefas") as? [String] else {return}
        listaDeTarefas = tarefas
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionarTarefa"{
            let viewController = segue.destination as! CadastroTarefaViewController
            viewController.listaDeTarefas = listaDeTarefas
        }
    }
    
    // MARK: - UITableViewController

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeTarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaDeTarefas", for: indexPath)
        
        celula.textLabel?.text = listaDeTarefas[indexPath.row]
        
        return celula
    }
    
    //Habilitando Delete e configurando
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            listaDeTarefas.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}

