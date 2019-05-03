//
//  ViewController.swift
//  Multiple_Counters
//
//  Created by 飯島大樹 on 2019/05/02.
//  Copyright © 2019 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    //json保存用構造体
    var jsonObj = Array<Dictionary<String,Int>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        print(arrayName);
        print(arrayCount);
        for (index, element) in arrayName.enumerated()
        {
            jsonObj.append([element : arrayCount[index]]);
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObj, options: [])
            let jsonStr = String(bytes: jsonData, encoding: .utf8)!
            print(jsonStr)  // 生成されたJSON文字列 => {"Name":"Taro"}
            
            
            
//
//            if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first
//            {
//                let filePath = dir.appendingPathComponent( "data.json" )
//
//                do {
//                    print("testing")
//                    print("filePath: \(filePath)")
//                    try jsonStr.write(to: filePath, atomically: true, encoding: .utf8)
//                } catch {
//                    print("error")
//                }
//            }
            
            
        } catch let error {
            print(error)
        }
        
        
        
    }
    
    
}

