//
//  ViewController.swift
//  Swift4TodoApp
//
//  Created by AdminAir on 2017/12/03.
//  Copyright © 2017年 ryotakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet var tableView: UITableView!
    
    var resultArray :[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // viewDidLoadが呼ばれた後に呼ばれる
        //viewDidLoadは１回しか呼ばれないが、viewWillAppearは画面遷移したときもよばれる
        // アプリ内にtodo_dataというキー値で保存された配列arrayを取り出す
        
        if UserDefaults.standard.object(forKey: "todo_data") != nil {
            resultArray = UserDefaults.standard.object(forKey: "todo_data") as! [String]
        }
        
        //delegateメソッドが呼ばれる
        tableView.reloadData()
    }
    
    //セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //動的に処理する
        return resultArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セル関連
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
        
    }
    
    //消す
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 配列のセルのスライドされた番号の消去
            resultArray.remove(at: indexPath.row)
            
            // その配列を再びアプリ内保存
            UserDefaults.standard.set(resultArray, forKey: "todo_data")
            
            // tableViewを更新
            tableView.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

