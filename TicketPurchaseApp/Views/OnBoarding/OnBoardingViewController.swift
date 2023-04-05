//
//  OnBoardingViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 2.04.2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
  
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlideModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                changeButtonTitle(lastPage: true)
            } else {
                changeButtonTitle(lastPage: false)
            }
        }
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            slides = [
                OnboardingSlideModel(title: "Bilet-le´ye Hoşgeldin!", description: "Planlarini yap, saniyeler icinde biletini al!", image: UIImage(named: "map")!),
                OnboardingSlideModel(title: "En güvenli uygulama karsinda!", description: "Biletini al ve hazirliklarini yap", image: UIImage(named: "suitcases")!),
                OnboardingSlideModel(title: "Hazır Mısın?", description: "Muhteşem bir deneyim için hemen kullanmaya başla!", image: UIImage(named: "mountain")!)
            ]
        }
       
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func changeButtonTitle(lastPage: Bool) {
        if lastPage {
            nextButton.setTitle("Kullanmaya Başla", for: .normal)
        } else {
            nextButton.setTitle("Sonraki", for: .normal)
            
        }
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}


extension OnBoardingViewController:  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

