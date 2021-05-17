//
//  TarefaCadastroViewController.swift
//  Lista de Tarefas
//
//  Created by Renilson Santana on 17/05/21.
//

import UIKit

class CadastroTarefaViewController: UIViewController {
    
    // MARK: - Atributos
    
    var listaDeTarefas:[String] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textTarefa: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        if textTarefa.text != ""{
            guard let tarefa = textTarefa.text else{ return }
            listaDeTarefas.append(tarefa)
            UserDefaults.standard.set(listaDeTarefas, forKey: "listaDeTarefas")
            textTarefa.text = ""
        }
    }
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Metodos
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
