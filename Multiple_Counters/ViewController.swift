//
//  ViewController.swift
//  Multiple_Counters
//
//  Created by 飯島大樹 on 2019/05/02.
//  Copyright © 2019 Daiki Iijima. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    //Int型、string型の配列を作る
    //引数で初期化
    //repeating : 初期化する値
    //count : 初期化する数
    var arrayCount: Array<Int> = Array(repeating: 0, count: 7)
    var arrayName: Array<String> = Array(repeating: "", count: 7)
    
    //カウント表示用ラベル宣言
    @IBOutlet weak var CountLabel1: UILabel!
    @IBOutlet weak var CountLabel2: UILabel!
    @IBOutlet weak var CountLabel3: UILabel!
    @IBOutlet weak var CountLabel4: UILabel!
    @IBOutlet weak var CountLabel5: UILabel!
    @IBOutlet weak var CountLabel6: UILabel!
    @IBOutlet weak var CountLabel7: UILabel!
    
    //カウント名用テキストボックス宣言
    @IBOutlet weak var CountName1: UITextField!
    @IBOutlet weak var CountName2: UITextField!
    @IBOutlet weak var CountName3: UITextField!
    @IBOutlet weak var CountName4: UITextField!
    @IBOutlet weak var CountName5: UITextField!
    @IBOutlet weak var CountName6: UITextField!
    @IBOutlet weak var CountName7: UITextField!
    
    @IBOutlet weak var CountTableView: UITableView!
    //Json変換用の構造体
    struct CountData: Codable {
        var Name : String
        var Count : Int
    }
    
    var arrayDatas: Array<Dictionary<String, Any>> = Array()
    
    let SaveDataPath = NSHomeDirectory()+"/Documents/data.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CountName1.delegate = self
        CountName2.delegate = self
        CountName3.delegate = self
        CountName4.delegate = self
        CountName5.delegate = self
        CountName6.delegate = self
        CountName7.delegate = self
        //保存していたJsonをロード
        do {
            let getData=getFileData(SaveDataPath)
            
            // パースする
            let items = try JSONSerialization.jsonObject(with: getData!) as! Array<Dictionary<String, Any>>
            
            for i in 0...6
            {
                arrayName[i] = items[i]["name"] as! String
                arrayCount[i] = items[i]["count"] as! Int
                
                print(items[i]["name"] as! String)
                print(items[i]["count"] as! Int)
            
            }
            
            CountLabel1.text = String(arrayCount[0])
            CountLabel2.text = String(arrayCount[1])
            CountLabel3.text = String(arrayCount[2])
            CountLabel4.text = String(arrayCount[3])
            CountLabel5.text = String(arrayCount[4])
            CountLabel6.text = String(arrayCount[5])
            CountLabel7.text = String(arrayCount[6])
            
            CountName1.text = String(arrayName[0])
            CountName2.text = String(arrayName[1])
            CountName3.text = String(arrayName[2])
            CountName4.text = String(arrayName[3])
            CountName5.text = String(arrayName[4])
            CountName6.text = String(arrayName[5])
            CountName7.text = String(arrayName[6])
            
        } catch {
            print(error)
        }
        
        // テーブルビューのデータソースとしてViewControllerを指定。（storyboardで設定しても良い。）
        self.CountTableView.dataSource = self
        
    }
    
    
    //ファイルのロード
    func getFileData(_ filePath: String) -> Data? {
        let fileData: Data?
        do {
            fileData = try Data(contentsOf: URL(fileURLWithPath: filePath))
        } catch {
            // ファイルデータの取得でエラーの場合
            fileData = nil
        }
        return fileData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    //カウントアップ用ボタンイベント
    @IBAction func OnClickAdd1(_ sender: Any) {
        arrayCount[0] = arrayCount[0] + 1
        CountLabel1.text = String(arrayCount[0])
    }
    @IBAction func OnClickAdd2(_ sender: Any) {
        arrayCount[1] = arrayCount[1] + 1
        CountLabel2.text = String(arrayCount[1])
    }
    @IBAction func OnClickAdd3(_ sender: Any) {
        arrayCount[2] = arrayCount[2] + 1
        CountLabel3.text = String(arrayCount[2])
    }
    @IBAction func OnClickAdd4(_ sender: Any) {
        arrayCount[3] = arrayCount[3] + 1
        CountLabel4.text = String(arrayCount[3])
    }
    @IBAction func OnClickAdd5(_ sender: Any) {
        arrayCount[4] = arrayCount[4] + 1
        CountLabel5.text = String(arrayCount[4])
    }
    @IBAction func OnClickAdd6(_ sender: Any) {
        arrayCount[5] = arrayCount[5] + 1
        CountLabel6.text = String(arrayCount[5])
    }
    @IBAction func OnClickAdd7(_ sender: Any) {
        arrayCount[6] = arrayCount[6] + 1
        CountLabel7.text = String(arrayCount[6])
    }
    
    //リセットボタンイベント
    @IBAction func OnClickReset(_ sender: Any) {
        
        for (index, var element) in arrayCount.enumerated()
        {
            arrayCount[index] = 0
        }
        
        CountLabel1.text = String(arrayCount[0]);
        CountLabel2.text = String(arrayCount[1]);
        CountLabel3.text = String(arrayCount[2]);
        CountLabel4.text = String(arrayCount[3]);
        CountLabel5.text = String(arrayCount[4]);
        CountLabel6.text = String(arrayCount[5]);
        CountLabel7.text = String(arrayCount[6]);
    }
    
    //保存ボタンイベント
    @IBAction func OnClickSave(_ sender: Any) {
        
        arrayName[0] = CountName1.text!
        arrayName[1] = CountName2.text!
        arrayName[2] = CountName3.text!
        arrayName[3] = CountName4.text!
        arrayName[4] = CountName5.text!
        arrayName[5] = CountName6.text!
        arrayName[6] = CountName7.text!
        
        //print(arrayName)
        //print(arrayCount)
        
        for i in 0...6
        {
            var data = Dictionary<String, Any>()
            data["name"] = arrayName[i]
            data["count"] = arrayCount[i]
            arrayDatas.append(data)
        }
        
        
        do
        {
            let jsonData = try JSONSerialization.data(withJSONObject: arrayDatas)
            // JSONデータを文字列に変換
            var jsonStr = String(bytes: jsonData, encoding: .utf8)!
           
            //Jsonを保存
            do {
                try jsonStr.write(toFile: SaveDataPath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write: \(error)")
            }
            
        } catch (let e) {
            print(e)
        }
    }
    
}

    // - ViewControllerにUITableViewDataSourceを準拠させる。
    // - 最低限必要なメソッドを実装する。
extension ViewController: UITableViewDataSource {
        // cellを返す。
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.text = "section:[\(indexPath.section)], row:[\(indexPath.row)]"
            return cell
        }
        
        //セルの数をいくつにするか。
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 100
        }
    }
    
    


