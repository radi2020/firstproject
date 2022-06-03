//
//  testmqtt.swift
//  CocoaAsyncSocket
//
//  Created by FILALI MOHAMED on 9/9/20.
//

import UIKit
import CocoaMQTT


class testmqtt: UIViewController {
    
    let defaultHost = "127.0.0.1"

    var mqtt: CocoaMQTT?
    var animal: String?
    
    var ipad=""
    var mymeship=""
    var vegeta=""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.isHidden = true
        

        
        
       // tryconnecttotcp()

        
        let alert = UIAlertController(title: "Mode de Connexion", message: "Connecter au reseaux LivePool-2O2O et choisir le mode Wifi Local", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Wifi Local", style: .default, handler: { (action: UIAlertAction!) in
            
            
         //   self.connecttotcp()
            
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
  let moveto = storyboard.instantiateViewController(withIdentifier: "connexequipement")as!connexequipement
   self.navigationController?.pushViewController(moveto, animated: true)
            
        }))
       
        
        
        
        
        alert.addAction(UIAlertAction(title: "", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let moveto = storyboard.instantiateViewController(withIdentifier: "connexequipement")as!connexequipement
//         self.navigationController?.pushViewController(moveto, animated: true)
        //SocketLayer.shared.setupConnection(host: mymeship, port: 5555)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func mqttSetting() {
        let clientID = "CocoaMQTT-\(animal!)-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: defaultHost, port: 1883)
        mqtt!.username = ""
        mqtt!.password = ""
        mqtt!.willMessage = CocoaMQTTMessage(topic: "/will", string: "dieout") as! CocoaMQTTWill
        mqtt!.keepAlive = 60
        mqtt!.delegate = self as! CocoaMQTTDelegate
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    

    
    
}

