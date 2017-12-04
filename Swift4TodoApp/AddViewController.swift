//
//  AddViewController.swift
//  Swift4TodoApp
//
//  Created by AdminAir on 2017/12/04.
//  Copyright © 2017年 ryotakahashi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var todo_data :[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        
        // 現在の配列の状況を取り出す
        if UserDefaults.standard.object(forKey: "todo_data") != nil{
            todo_data = UserDefaults.standard.object(forKey: "todo_data") as! [String]
        }
        
        
        // textfieldで記入されたテキストを配列に格納
        todo_data.append(textField.text!)
        
        // 配列をアプリに保存する
        UserDefaults.standard.set(todo_data, forKey: "todo_data")
        
        // 画面を戻る
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
