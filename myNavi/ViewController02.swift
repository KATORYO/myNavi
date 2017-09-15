//
//  ViewController02.swift
//  myNavi
//
//  Created by 加藤諒 on 2017/09/13.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit
import MapKit

class ViewController02: UIViewController {
  
  
  
  //選択されたエリア名を保存するプロパティ
  var scSelectedName = ""
  //上のラベル
  @IBOutlet weak var myLabel: UILabel!
  @IBOutlet weak var myView: UIImageView!
  
  @IBOutlet weak var myMap: MKMapView!
  @IBOutlet weak var myLabel2: UILabel!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("選択されたエリアは\(scSelectedName)です")

    
    //プロパティリスト読み込み
    //ファイルパスを取得（エリア名が格納されているプロパティリスト）
    let filePath = Bundle.main.path(forResource: "GuideList", ofType: "plist")
    
    //ファイルの内容を読み込んでディクショナリー型に格納
    let dic = NSDictionary(contentsOfFile: filePath!)
    
    let dic_class = dic?[scSelectedName] as! NSDictionary
    
    print(dic_class)
    
    print(dic_class["description"]!)
    
    
    for(key,data) in dic!{
      let dicB:NSDictionary = data as! NSDictionary
      if ((key as! NSString) as String == scSelectedName) {
        navigationItem.title = scSelectedName
        myLabel.text = dicB["description"] as! String
        myLabel2.text = dicB["description2"] as!String
        myView.image = UIImage(named:dicB["image"] as! String)
        
        let latitude:String = dicB["latitude"] as! String
        let longitude:String = dicB["longitude"] as! String
        
        let coodinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
        let span = MKCoordinateSpanMake(0.04, 0.04)
        let region = MKCoordinateRegionMake(coodinate, span)
        myMap.setRegion(region, animated:true)
        
        let myPin: MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = coodinate
        myPin.title = scSelectedName
        myMap.addAnnotation(myPin)
        
      }
      
    }
    
    
    //print(dic?[scSelectedName])
    
    //TODO:MiniGuidebookの詳細画面を完成させましょう
    //ヒント:latitude,longitudeがリスト内ではString型
    //実際に使用するときはDouble型へ型変換が必要
    //String型->Double型の型変換におすすめな関数はatof()です
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
