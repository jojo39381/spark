//
//  ResultsViewController.swift
//  spark
//
//  Created by Joseph Yeh on 5/23/20.
//  Copyright © 2020 Joseph Yeh. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ResultsViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, ResultsDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 45
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(dateTitles.count)
        print("..........`")
        return dateTitles.count
    }
    
    
    var dateTitles:[String]!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let dateArray = dates[sortedDateScores[indexPath.item].key]!
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "lol", for: indexPath) as! ResultsCell
        let currentPlace = dateTitles[indexPath.item]
        myCell.titleLabel.text = currentPlace
        myCell.descriptionLabel.text = activityModel.restaurants[currentPlace]!.address[0]
//        myCell.setupViews()
//        myCell.dateArray = dates[sortedDateScores[indexPath.item].key]!
//        var dateTitle = dates[sortedDateScores[indexPath.item].key]![0]
//        myCell.score.text = String(sortedDateScores[indexPath.item].value)
//        myCell.contentView.backgroundColor = .white
//        myCell.delegate = self
//        myCell.titleLabel.text = dateTitle
//
//         var dateInfo = [String: [Any]]()
//
//
//        dateInfo.updateValue(Array(restaurantModel.restaurants[dateTitle]!), forKey: dateTitle)
//        let address = dateInfo[dateTitle]![5] as! [String]
//
//        var addressString = ""
//               for i in 0..<address.count {
//                   addressString.append(address[i])
//                   if i != address.count - 1 {
//                       addressString.append("\n")
//                   }
//               }
//        myCell.descriptionLabel.text = addressString
//
//        return myCell
        
        
        
        
        
        return myCell
        
    }
    
  
    
    var foodCentric = true
    var numActivities = 2
    var startDict: [String: [Any]]!
    var endDict: [String: [Any]]!
    var sortedDateScores = [Dictionary<String, Int>.Element]()
    var dates = [String: [String]]()
    var usedPlace = [String]()
//
//    func rateDates() {
//        if foodCentric {
//            startDict = restaurantModel.restaurants
//            endDict = activityModel.restaurants
//        } else {
//            startDict = activityModel.restaurants
//            endDict = restaurantModel.restaurants
//        }
//        var i = 0
//        var dateScores = [String: Int]()
//        for initialPlace in calculateScore(startName: "userLocation", startLocation: userLocation, startDict: ["userLocation": [["userLocation"]]], endDict: startDict).sorted(by: {$0.1 > $1.1}) {
//            let date = makeDate(initialPlace: initialPlace)
//            dateScores["Date \(i)"] = date[0] as? Int
//            dates["Date \(i)"] = Array(date[1..<date.count]) as? [String]
//            i += 1
//        }
//        sortedDateScores = dateScores.sorted {$0.1 > $1.1}
//    }
//
//    func makeDate(initialPlace: Dictionary<String, Int>.Element) -> [Any] {
//        var startP = startDict!
//        var endP = endDict!
//        var date = [Any]()
//        var startPlace = initialPlace
//        date.append(startPlace.value)
//        date.append(startPlace.key)
//        for _ in 1...self.numActivities {
//            let startCord = startP[startPlace.key]![3] as! [Float]
//            print("lmao")
//
//
//            startPlace = self.calculateScore(startName: startPlace.key, startLocation: CLLocation(latitude: CLLocationDegrees(startCord[0]), longitude: CLLocationDegrees(startCord[1])), startDict: startP, endDict: endP).sorted {$0.1 > $1.1}.first!
//
//            date[0] = date[0] as! Int + startPlace.value
//            date.append(startPlace.key)
//            usedPlace.append(startPlace.key)
//            startP = endP
//            endP = activityModel.restaurants
//        }
//        date[0] = date[0] as! Int / (self.numActivities + 1)
//        return date
//    }
//
//    func calculateScore(startName: String, startLocation: CLLocation, startDict: [String: [Any]], endDict: [String: [Any]]) -> [String: Int] {
//        var dateScore = [String: Int]()
//        print("CountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCountCount")
//        print(endDict.count)
//        print(usedPlace.count)
//        if (endDict.count == usedPlace.count + 1) {
//            usedPlace.removeAll()
//        }
//        for end in endDict {
//            if !usedPlace.contains(end.key) {
//                if (startName != end.key) {
//                    let startCats = startDict[startName]![0] as! [String]
//                    let endCats = end.value[0] as! [String]
//                    var same = false
//                    for startCat in startCats {
//                        for endCat in endCats {
//                            let scArr = startCat.lowercased().split(separator: " ")
//                            let ecArr = endCat.lowercased().split(separator: " ")
//                            for scWord in scArr {
//                                for ecWord in ecArr {
//                                    same = same || scWord == ecWord || scWord.contains(ecWord) || ecWord.contains(scWord)
//                                }
//                            }
//                        }
//                    }
//                    if !same {
//                        let endCord = end.value[3] as! [Float]
//                        let distance = calculateDistance(startLocation: startLocation, endLocation: CLLocation(latitude: CLLocationDegrees(endCord[0]), longitude: CLLocationDegrees(endCord[1]))) * 1000
//                        let distanceScore = Int((1 - distance / Double(radius)) * 33)
//                        let ratingScore = end.value[1] as! Float / 5 * 33
//                        let reviewScore = min(end.value[2] as! Float / 500 * 33, 33)
//                        dateScore[end.key] = Int(Float(distanceScore) + ratingScore + reviewScore)
//
//                    }
//                }
//            }
//        }
//        return dateScore
//    }
//
//    func calculateDistance(startLocation: CLLocation, endLocation: CLLocation) -> Double {
//        let lat1 = startLocation.coordinate.latitude
//        let lon1 = startLocation.coordinate.longitude
//        let lat2 = endLocation.coordinate.latitude
//        let lon2 = endLocation.coordinate.longitude
//
//        let p = 0.017453292519943295;    // Math.PI / 180
//        let a = 0.5 - cos((lat2 - lat1) * p)/2 +
//              cos(lat1 * p) * cos(lat2 * p) *
//              (1 - cos((lon2 - lon1) * p))/2
//
//      return 12742 * asin(sqrt(a)) // 2 * R; R = 6371 km
//    }
//
//    func calculateTime(startLocation: CLLocation, endLocation: CLLocation, completion: @escaping (Int) -> ()) {
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startLocation.coordinate, addressDictionary: nil))
//        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endLocation.coordinate, addressDictionary: nil))
//        request.requestsAlternateRoutes = false // if you want multiple possible routes
//        request.transportType = .automobile
//        let directions = MKDirections(request: request)
//        directions.calculate {(response, error) in
//
//            guard let response = response else {
//                if let error = error {
//                    print("Error: \(error)")
//                }
//                return
//            }
//
//          // Lets Get the first suggested route and its travel time
//            if response.routes.count > 0 {
//                let route = response.routes[0]
//                completion(Int(route.expectedTravelTime))
//            }
//        }
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: 150)
    }
    
    
    let resultsCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        
        return collectionView
    }()
    
    
    
    
   
    var activityModel: ActivityModel!
    var userSelectedModel: UserSelectedModel!
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
//        rateDates()
        print("////////")
        print(dateTitles)

        view.addSubview(resultsCollectionView)
        
        
        
        resultsCollectionView.frame = CGRect(x:0,y:0,width:view.frame.width, height:view.frame.height)
        
        resultsCollectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        resultsCollectionView.delegate = self
        resultsCollectionView.dataSource = self
        resultsCollectionView.register(ResultsCell.self, forCellWithReuseIdentifier: "lol")
        resultsCollectionView.backgroundColor = .white
        setupNav()
        
        
    }
    
    
    func setupNav() {
        let navigationBar = self.navigationController?.navigationBar
        navigationItem.hidesBackButton = true
        navigationBar?.prefersLargeTitles = true
        navigationBar?.tintColor = .white
        navigationBar?.backgroundColor = .white
        self.title = "Spark"
    }
    
    
    func goToDetails(dateTitle : String) {
        let vc = DetailsViewController()
        vc.dateTitle = dateTitle
        vc.dateDetails = activityModel.restaurants[dateTitle]
        
        var startLocation = userLocation
//        let act = activityModel.restaurants[dateTitle]
//            if act != nil {
//                let actCoordinates = activityModel.restaurants[dateTitle]![3] as! [Float]
//                dateDict.updateValue(actCoordinates, forKey: dateTitle)
//                imageDict.updateValue(activityModel.restaurants[dateTitle]![4] as! String, forKey: dateTitle)
//                dateInfo.updateValue(Array(activityModel.restaurants[dateTitle]!), forKey: dateTitle)
//                dateScores[0] += Int(activityModel.restaurants[dateTitle]![1] as! Float / 5 * 33)
//                dateScores[1] += Int(min(activityModel.restaurants[dateTitle]![2] as! Float / 500 * 33, 33))
//                let actLocation = CLLocation(latitude: CLLocationDegrees(actCoordinates[0]), longitude: CLLocationDegrees(actCoordinates[1]))
//                let distance = calculateDistance(startLocation: startLocation!, endLocation: actLocation) * 1000
//                dateScores[2] += Int((1 -  distance / Double(radius)) * 33)
//                startLocation = actLocation
//            }
//            else {
//                let resCoordinates = restaurantModel.restaurants[dateTitle]![3] as! [Float]
//                dateDict.updateValue(resCoordinates, forKey: dateTitle)
//                imageDict.updateValue(restaurantModel.restaurants[dateTitle]![4] as! String, forKey: dateTitle)
//                dateInfo.updateValue(Array(restaurantModel.restaurants[dateTitle]!), forKey: dateTitle)
//                dateScores[0] += Int(restaurantModel.restaurants[dateTitle]![1] as! Float / 5 * 33)
//                dateScores[1] += Int(min(restaurantModel.restaurants[dateTitle]![2] as! Float / 500 * 33, 33))
//                let resLocation = CLLocation(latitude: CLLocationDegrees(resCoordinates[0]), longitude: CLLocationDegrees(resCoordinates[1]))
//                let distance = calculateDistance(startLocation: startLocation!, endLocation: resLocation) * 1000
//                dateScores[2] += Int((1 -  distance / Double(radius)) * 33)
//                startLocation = resLocation
//            }
//            dateOrder.append(dateTitle)
        
            
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}

