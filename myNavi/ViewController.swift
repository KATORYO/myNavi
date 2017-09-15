//
//  ViewController.swift
//  myNavi
//
//  Created by 加藤諒 on 2017/09/12.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit

//var cebuGuide:[String] = ["","","",""]

//var name = ""

  var myView:UIImage = UIImage()

//var selectedIndex = -1 //選択された行番号！


//プロトコルを記述！！
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var myMyview: UIImageView!

  @IBOutlet weak var myTableView: UITableView!
  
  //紹介したいエリア名が格納される配列
  var placeList:[String] = []
  
  //選択された行の表示エリア名
  var selectedName = ""
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //ファイルパスを取得(エリア名が格納されているプロパティリスト)
    let filePath = Bundle.main.path(forResource: "GuideList", ofType: "plist")
    
    //ファイルの内容を読み込んでディクショナリー型に格納(わかりやすくするため)
    let dic = NSDictionary(contentsOfFile:filePath!)
    
    //TableViewで扱いやすい形（エリア名の入っている配列）を作成
    //dictionary型の高速列挙
    //⌘　shift　K　でエラー更新！
    for(key,data) in dic! {
      print(key) //アヤラ、モアルボアルが取得できているのが確認できる
      placeList.append(key as! String)
      
      
      
      //TODO:MiniGuidebookの詳細画面を完成させる
      //ヒント：latitude,longitudeがリスト内ではString型
      //実際に使用するときはDouble型へ型変換が必要
      //Strng型->Double型の型変換におすすめな関数はatof()
    }
    
  }
  
  // 2.行数セット
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return placeList.count
  }
  
  
  // 3.表示する文字のセット
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    //cell.textLabel?.text = "\(indexPath.row)行目"
    cell.textLabel?.text = placeList[indexPath.row]
    
    //cell.imageView?.image =

    return cell
    
  }
  
  //押されたときの処理！！
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //選択されたエリア名を保存
    selectedName = placeList[indexPath.row]

    
    //セグエを指定して、画面遷移 アイデンティファイヤーの通路！
    performSegue(withIdentifier: "showDetail", sender: nil)
  }
  
  //ボタンはって、コードを関数➡︎EXITにコントロールで持ってく。backボタンを指定。矢印をたどって戻るよ！みたいなUIStoryboard
  @IBAction func back (_ segue:UIStoryboardSegue){}
  
  //セグエを使って画面を移動しようとしているとき発動するメソッド！
  //override(上書き)だが、prepareはviewcontroller画面に組み込まれているため、上書きする必要がある！
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    //移動先の画面に渡したい情報をセットできる
    //dv　今から移動する画面のオブジェクト(インスタンス)
   //移動先画面のオブジェクトを取得！
    let dv: ViewController02 = segue.destination as! ViewController02

    
    //作成しておいたプロパティに、選択されたエリア名を保存
    dv.scSelectedName = selectedName
    //dv.Image = selectedName
    //dv.sentence = name
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }


}

