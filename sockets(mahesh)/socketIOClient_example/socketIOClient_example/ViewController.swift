//
//  ViewController.swift
//  socketIOClient_example
//
//  Created by Administrator on 24/12/2018.
//  Copyright © 2018 mahesh lad. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController, YPSignatureDelegate , UITableViewDelegate, UITableViewDataSource {
   
    
    var socket : SocketIOClient!
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    
    @IBOutlet weak var chatTextField: UITextField!
    
    @IBOutlet weak var nicknameField: UITextField!
    // let socket = manager.defaultSocket
    
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages : [String] = []
    
    fileprivate func setupsocket() {
        socket = manager.defaultSocket
        //  socket.disconnect()
        addHandlers()
        socket.connect()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
        
        setupsocket()
        
        signatureView.delegate = self
        
    }
    
    func addHandlers() {
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on("chat message") { [weak self] data, ack in
            if  let message = data[0] as? String {
                print(message)
                self!.messages.insert(message, at: 0)
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func sendMessageButton(_ sender: Any) {
        
        if  let message = self.chatTextField.text {
            if let nickName = self.nicknameField.text {
                let messageTosend = nickName + " : " + message
                
                socket.emit("chat message",  messageTosend)
            }
        }
        self.chatTextField.text = ""
        self.chatTextField.resignFirstResponder()
    }
    @IBAction func clearSignature(_ sender: UIButton) {
        // This is how the signature gets cleared
        self.signatureView.clear()
    }
    
    // Function for saving signature
    @IBAction func saveSignature(_ sender: UIButton) {
        // Getting the Signature Image from self.drawSignatureView using the method getSignature().
        if let signatureImage = self.signatureView.getSignature(scale: 10) {
            
            // Saving signatureImage from the line above to the Photo Roll.
            // The first time you do this, the app asks for access to your pictures.
            UIImageWriteToSavedPhotosAlbum(signatureImage, nil, nil, nil)
            
            // Since the Signature is now saved to the Photo Roll, the View can be cleared anyway.
            self.signatureView.clear()
        }
    }
    
    // MARK: - Delegate Methods
    
   
    // stopping it from scrolling while signing.
    func didStart(_ view : YPDrawSignatureView) {
        print("Started Drawing")
    }
    
    // didFinish() is called rigth after the last touch of a gesture is registered in the view.
   
    func didFinish(_ view : YPDrawSignatureView) {
        print("Finished Drawing")
    }
    
    @IBAction func sendSignaturePress(_ sender: Any) {
        
        if let signatureImage = self.signatureView.getSignature(scale: 10) {
            //Now use image to create into NSData format
            let imageData:NSData = signatureImage.pngData()! as NSData
            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            //  print(strBase64)
            socket.emit("base64",  strBase64)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = messages[indexPath.row]
        
        return cell
    }
    
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
        // Remove the blue view.
        chatTextField.resignFirstResponder()
        nicknameField.resignFirstResponder()
        
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.superview!.superclass! .isSubclass(of: UIButton.self) {
            return false
        }
        return true
    }
}

