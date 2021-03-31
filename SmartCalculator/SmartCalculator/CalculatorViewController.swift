//
//  EMerchant_CalculatorViewController.swift
//  Easy-Merchant
//
//  Created by Yamen Emon on 18/1/21.
//  Copyright © 2021 SSL Wireless. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    enum Theme{
        case light
        case dark
    }
    
    @IBOutlet weak var navigationBarContainer: UIView!
    
    @IBOutlet weak var vwCalculatorInput: UIView!
    @IBOutlet weak var lblCalculatorInput: UILabel!
    
    @IBOutlet weak var btnQuickSell: UIButton!
    @IBOutlet weak var btnCustomerDetails: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnSubstract: UIButton!
    @IBOutlet weak var btnAddition: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    
    @IBOutlet weak var btnDoubleZeero: UIButton!
    @IBOutlet weak var btnZeero: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
   
    
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var calculatorContainerView: UIView!
    
    @IBOutlet weak var ConstraintBaseViewTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var ConstraintBaseViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var viewHistory: UIView!
    
    
    /*
     btnAC
     btnPercent
     btnDivision
     btnMultiply
     btnSubstract
     btnAddition
     btnDecimal
     btnEqual
     
     btnOne
     btnTwo
     btnThree
     btnFour
     btnFive
     btnSix
     btnSeven
     btnEight
     btnNine
     
     btnDoubleZeero
     btnZeero
     
     
     
     */
    
    var maxDigit = 12
    let processor = InfixProcessor(initStr: "")
    let currentTheme : Theme = .dark
    var labelHistory: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.lightGray
        label.numberOfLines = 1
                label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        scrollView.bounces = false
        scrollView.isDirectionalLockEnabled = true
       
        
        return scrollView
    }()
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
          super.viewWillTransition(to: size, with: coordinator)
//          if UIDevice.current.orientation.isLandscape {
//              print("Landscape")
//            print(self.view.frame.height)
//            let spaceX = self.view.frame.height/6.0
//            ConstraintBaseViewLeading.constant = spaceX
//            ConstraintBaseViewTrailing.constant = -spaceX
//            
//            
//          } else {
//              print("Portrait")
//            print(self.view.frame.width)
//            let spaceX = 0.0
//            ConstraintBaseViewLeading.constant = CGFloat(spaceX)
//            ConstraintBaseViewTrailing.constant = CGFloat(-spaceX)
//          }
      }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        themeChange()
        setupHistory()
        
        //languageChange()
        //btnQuickSell.setBackgroundColor(color: .coolGrey, forState: .disabled)
        //btnQuickSell.setImage(UIImage(named: "quickSale"), for: .disabled)
        
        //btnQuickSell.setBackgroundColor(color: .warmPurple, forState: .selected)
        //btnQuickSell.setImage(UIImage(named: "quickSaleColor"), for: .selected)
        
        //btnCustomerDetails.setBackgroundColor(color: .coolGrey, forState: .disabled)
        //btnCustomerDetails.setImage(UIImage(named: "customerDetails"), for: .disabled)
        //btnCustomerDetails.setBackgroundColor(color: .btnYellow, forState: .selected)
        //btnCustomerDetails.setImage(UIImage(named: "loyality"), for: .selected)
        
        
        viewRadiousChange(view: vwCalculatorInput)
        vwCalculatorInput.layer.borderWidth = 1
        vwCalculatorInput.layer.borderColor = UIColor(red: 220/255, green: 222/255, blue: 226/255, alpha: 1.0).cgColor
        
        //viewRadiousChange(view: btnQuickSell)
        //viewRadiousChange(view: btnCustomerDetails)
        
        viewRadiousChange(view: btnAC,addShadow: true)
        viewRadiousChange(view: btnPercent,addShadow: true)
        viewRadiousChange(view: btnDivision,addShadow: true)
        viewRadiousChange(view: btnMultiply,addShadow: true)
        viewRadiousChange(view: btnSubstract,addShadow: true)
        viewRadiousChange(view: btnAddition,addShadow: true)
        viewRadiousChange(view: btnDecimal,addShadow: true)
        viewRadiousChange(view: btnEqual,addShadow: true)
        
        viewRadiousChange(view: btnOne,addShadow: true)
        viewRadiousChange(view: btnTwo,addShadow: true)
        viewRadiousChange(view: btnThree,addShadow: true)
        viewRadiousChange(view: btnFour,addShadow: true)
        viewRadiousChange(view: btnFive,addShadow: true)
        viewRadiousChange(view: btnSix,addShadow: true)
        viewRadiousChange(view: btnSeven,addShadow: true)
        viewRadiousChange(view: btnEight,addShadow: true)
        viewRadiousChange(view: btnNine,addShadow: true)
        
        viewRadiousChange(view: btnDoubleZeero,addShadow: true)
        viewRadiousChange(view: btnZeero,addShadow: true)
        
        
        
    }
    func setupHistory(){
        scrollView.addSubview(labelHistory)
        self.viewHistory.addSubview(scrollView)
        
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: viewHistory.leftAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: viewHistory.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: viewHistory.rightAnchor, constant: 0.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: viewHistory.bottomAnchor, constant: 0).isActive = true
        
        // add labelOne to the scroll view
        scrollView.addSubview(labelHistory)
        
        // constrain labelOne to left & top with 16-pts padding
        // this also defines the left & top of the scroll content
        labelHistory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8.0).isActive = true
        labelHistory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8.0).isActive = true
        // set the width of the label to the width of the scrollView (-16 for 8.0 padding on each side)
       // labelHistory.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16.0).isActive = true
        
        // configure label: Zero lines + Word Wrapping
        labelHistory.numberOfLines = 1
        labelHistory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelHistory.font = UIFont.systemFont(ofSize: 17.0)
        scrollView.contentSize = CGSize(width:labelHistory.frame.width, height: 10)


       
        // add labelTwo to the scroll view
       
    }
    
    func themeChange(){
        if currentTheme == .light{
            self.view.backgroundColor = UIColor.white
            baseView.backgroundColor = .white
            navigationBarContainer.backgroundColor = .white
            topContainerView.backgroundColor = .white
            vwCalculatorInput.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 247/255, alpha: 1.0)
            lblCalculatorInput.textColor =  .black
            calculatorContainerView.backgroundColor = UIColor(red: 210/255, green: 212/255, blue: 216/255, alpha: 1.0)
            
            
            
        }else{
            self.view.backgroundColor = UIColor.black
            
            baseView.backgroundColor = .black
            navigationBarContainer.backgroundColor = .black
            topContainerView.backgroundColor = .black
            vwCalculatorInput.backgroundColor = UIColor.black
            lblCalculatorInput.textColor =  .white
            calculatorContainerView.backgroundColor = UIColor.black
            
            
            btnAC.backgroundColor = .orange
            btnAC.setTitleColor(.white, for: .normal)
            btnPercent.backgroundColor = .orange
            btnPercent.setTitleColor(.white, for: .normal)
            
            btnDivision.backgroundColor = .orange
            btnDivision.setTitleColor(.white, for: .normal)
            
            btnMultiply.backgroundColor = .orange
            btnMultiply.setTitleColor(.white, for: .normal)
            
            
            btnSubstract.backgroundColor = .orange
            btnSubstract.setTitleColor(.white, for: .normal)
            
            btnAddition.backgroundColor = .orange
            btnAddition.setTitleColor(.white, for: .normal)
            
            btnDecimal.backgroundColor = .darkGray
            btnDecimal.setTitleColor(.white, for: .normal)
            
            btnEqual.backgroundColor = .orange
            btnEqual.setTitleColor(.white, for: .normal)
            
            btnOne.backgroundColor = .darkGray
            btnOne.setTitleColor(.white, for: .normal)
            
            btnTwo.backgroundColor = .darkGray
            btnTwo.setTitleColor(.white, for: .normal)
            
            btnThree.backgroundColor = .darkGray
            btnThree.setTitleColor(.white, for: .normal)
            
            btnFour.backgroundColor = .darkGray
            btnFour.setTitleColor(.white, for: .normal)
            
            btnFive.backgroundColor = .darkGray
            btnFive.setTitleColor(.white, for: .normal)
            
            btnSix.backgroundColor = .darkGray
            btnSix.setTitleColor(.white, for: .normal)
            
            btnSeven.backgroundColor = .darkGray
            btnSeven.setTitleColor(.white, for: .normal)
            
            btnEight.backgroundColor = .darkGray
            btnEight.setTitleColor(.white, for: .normal)
            
            btnNine.backgroundColor = .darkGray
            btnNine.setTitleColor(.white, for: .normal)
            
            btnDoubleZeero.backgroundColor = .darkGray
            btnDoubleZeero.setTitleColor(.white, for: .normal)
            
            btnZeero.backgroundColor = .darkGray
            btnZeero.setTitleColor(.white, for: .normal)
        }
    }

    
    func viewRadiousChange(view: UIView,addShadow:Bool = false){
        view.layer.cornerRadius = 30
        if addShadow == true{
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            view.layer.shadowOpacity = 0.4
            view.layer.shadowRadius = 4.0
            view.layer.shadowOffset = CGSize(width: 0 , height: 2)
            
            
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func processorCalling(inputStr:String){
        let char = [Character]("\(inputStr)")
        processor.process(nextAction: char.first!)
        lblCalculatorInput.text = processor.displayStr.replacingOccurrences(of: ".00", with: "")
        
    }
    //MARK:- BUTTON ALL ACTION
    
    @IBAction func btnDigitAction(_ sender: UIButton) {
        if lblCalculatorInput.text?.count ?? 0 < maxDigit{
            var inText = ""
            if sender.tag < 10{
                processorCalling(inputStr: "\(sender.tag)")
                inText = "\(sender.tag)"

            }else if sender.tag == 10{
                inText = "0"
                processorCalling(inputStr: "0")
            }else if sender.tag == 100{
                inText = "00"
                processorCalling(inputStr: "0")
                processorCalling(inputStr: "0")
            }else if sender.tag == 11{
                inText = "%"
                processorCalling(inputStr: "%")
            }else if sender.tag == 12{
                inText = "/"
                processorCalling(inputStr: "/")
            }else if sender.tag == 13{
                inText = "x"
                processorCalling(inputStr: "*")
            }else if sender.tag == 14{
                inText = "-"
                processorCalling(inputStr: "-")
            }else if sender.tag == 15{
                inText = "+"
                processorCalling(inputStr: "+")
            }else if sender.tag == 16{
                inText = "="
                processorCalling(inputStr: "=")
            }else if sender.tag == 17{
                inText = "."
                processorCalling(inputStr: ".")
            }else if sender.tag == 18{
                labelHistory.text = ""
                inText = ""
                processorCalling(inputStr: "R")
            }else if sender.tag == 19{
                processorCalling(inputStr: "<")
            }
            ScrollViewUpdate(senderText: "\(inText)")
            
            //MARK:- Button Enable Condition
            
//            btnQuickSell.isSelected = processor.isComplete
//            btnQuickSell.isEnabled = processor.isComplete
//            btnCustomerDetails.isSelected  = processor.isComplete
//            btnCustomerDetails.isEnabled = processor.isComplete
        }else{
            processorCalling(inputStr: "R")
            labelHistory.text = ""
        }
    }
    
    func ScrollViewUpdate(senderText : String){
        
        print(self.scrollView.contentOffset.x)
        self.scrollView.contentOffset.x  = self.scrollView.contentSize.width + 10
        labelHistory.text = "\(labelHistory.text ?? "")\(senderText)"
        scrollView.contentSize = CGSize(width:labelHistory.frame.width + 20, height: 10)
    }
    
    @IBAction func btnQuickSale(_ sender: UIButton) {
        if sender.state.rawValue == 1{
            // self.showToast(message: "Abc")
            return
        }else if sender.state.rawValue == 5{
            guard  let amountStr  = lblCalculatorInput.text ,let  amount = Double(amountStr) else{
                //showToast(message: helper.getStringForKey("sp_wrong_amount")!)
                return
            }
            //presenter.createSales(totalAmount: amount, dueAmount: 0.0,  paymentType: PaymentMethod.cash, customerName: "", customerNumber: "")
        }
      
    }
    
    @IBAction func btnCustomerDetails(_ sender: UIButton) {
      
        
    }
}
extension CalculatorViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}

