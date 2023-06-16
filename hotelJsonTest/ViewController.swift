//
//  ViewController.swift
//  hotelJsonTest
//
//  Created by 吳宗祐 on 2023/6/14.
//

import UIKit
struct allData {
    var touristSpots: [TainanPlaces]
    var hotels: [TainanPlaces]
    var restaurants: [TainanPlaces]
}

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var districtTxt: UITextField!
    var pkvDistrict: UIPickerView!
    var districtButton: UIButton!
    let region = ["台南"]
    let districtsTainan = [
        "新營","鹽水","白河","柳營","後壁","東山","麻豆","下營","六甲","官田","大內","佳里","學甲","西港","七股","將軍","北門","新化","新市","善化","安定","山上","玉井","楠西","南化","左鎮","仁德","歸仁","關廟","龍崎","永康","東區","南區","中西區","北區","安南","安平"
    ]


    var allCulturalCenters = [TainanPlaces]()
    var allRestaurants = [TainanPlaces]()
    var allHostels = [TainanPlaces]()

    var allDataTainan = [[TainanPlaces]]()


    func fetchTest(urlRawJson: String, index: Int) {
        if let url = URL(string: urlRawJson) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data{
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([TainanPlaces].self, from: data)
                        DispatchQueue.main.async { [self] in
                            allDataTainan.append(decodeData)
                            allDataTainan.sort {
                                $0.count < $1.count
                            }
                            print(allDataTainan.map({
                                $0.count
                            }))
                        }
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        districtTxt.delegate = self
        pkvDistrict = UIPickerView()
        pkvDistrict.delegate = self
        pkvDistrict.dataSource = self
        districtTxt.inputView = pkvDistrict
        let toolBar = UIToolbar()
                toolBar.barStyle = UIBarStyle.default
                toolBar.isTranslucent = true
                toolBar.tintColor = .systemBlue
                toolBar.sizeToFit()
        //加入toolbar的按鈕跟中間的空白
        let doneButton = UIBarButtonItem(title: "確認", style: .plain, target: self, action: #selector(submit))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)

        //設定toolBar可以使用
        toolBar.isUserInteractionEnabled = true
        districtTxt.inputAccessoryView = toolBar


        fetchTest(urlRawJson: "https://raw.githubusercontent.com/shang-jungwu/json/main/tainan", index: 0)
        fetchTest(urlRawJson: "https://raw.githubusercontent.com/shang-jungwu/json/main/tainan_hotels", index: 1)
        fetchTest(urlRawJson: "https://raw.githubusercontent.com/shang-jungwu/json/main/tainan_dining", index: 2)

    }

    @objc func submit() {
        let selectedRow = pkvDistrict.selectedRow(inComponent: 1)
        districtTxt.text = districtsTainan[selectedRow]
        self.districtTxt.resignFirstResponder()
    }

    @objc func cancel() {
        self.districtTxt.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return region.count
        case 1:
            return districtsTainan.count
        default:
            return 0
        }

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return region[0]
        case 1:
            return districtsTainan[row]
        default:
            return ""
        }
    }


}
