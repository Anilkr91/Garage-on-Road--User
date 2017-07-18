//
//  SecondViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//


import UIKit

class SecondViewController: UIPageViewController {

    var imagesArray = ["profile","ic_cloud","profile","ic_cloud"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        self.setViewControllers([self.getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }

    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController

        pageContentViewController.image = "\(imagesArray[index])"
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
}

extension SecondViewController: UIPageViewControllerDataSource {
    
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
                var index = pageContent.pageIndex
        
                if ((index == 0) || (index == NSNotFound)) {
                    return nil
                }
                index -= 1;
                return getViewControllerAtIndex(index: index)
    }
    
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContent: PageContentViewController = viewController as! PageContentViewController
                var index = pageContent.pageIndex
        
                if (index == NSNotFound) {
                    return nil;
                }
        
                index += 1;
                if (index == imagesArray.count) {
                    return nil;
                }
                return getViewControllerAtIndex(index: index)
        
    }
}


extension SecondViewController: UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return imagesArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        if let identifier = viewControllers?.first?.restorationIdentifier {
            if let index = imagesArray.index(of: identifier) {
                return index
            }
        }
        return 0
    }
}
