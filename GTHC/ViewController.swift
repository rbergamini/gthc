//
//  ViewController.swift
//  GTHC
//
//  Created by Ryan Bergamini on 11/12/16.
//  Copyright © 2016 Duke Innovation CoLab. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UIPageViewControllerDataSource
{
    var pageViewController: UIPageViewController?
    
    let messageContents: [String] = ["Welcome To The","Game","Tenting","Help","Center"]
    let backgroundImageNames: [String] = ["Duke_Bball_1","Duke_Bball_2","Duke_Bball_3","Duke_Bball_4","Duke_Bball_5"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the PageViewController
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        self.pageViewController!.dataSource = self
        
        let firstPage: PageContentViewController = pageContentViewController(atIndex:0)!
        let viewControllers: [UIViewController] = [firstPage]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
    
        self.pageViewController!.view.frame = CGRect(x: 0,y: 0,width: view.frame.width,height: view.frame.height)
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview((self.pageViewController?.view)!)
        self.pageViewController!.didMove(toParentViewController: self)
    }
    
    func pageContentViewController(atIndex index: Int) -> PageContentViewController?
    {
        
        if let pageContentViewController: PageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentController") as? PageContentViewController
        {
            pageContentViewController.messageContent = messageContents[index]
            
            let image: UIImage = UIImage(named:backgroundImageNames[index])!
            
            pageContentViewController.backgroundImage = image
            pageContentViewController.pageIndex = index
            
            return pageContentViewController
        }
        
        return nil;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let currentPageContentViewController: PageContentViewController = viewController as!PageContentViewController
        
        let currentIndex = currentPageContentViewController.pageIndex;
    
        if currentIndex >= presentationCount(for:pageViewController) - 1
        {
            return nil
        }
        else
        {
            return pageContentViewController(atIndex: currentIndex+1)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let currentPageContentViewController: PageContentViewController = viewController as!PageContentViewController
        
        let currentIndex = currentPageContentViewController.pageIndex;
        
        if currentIndex == 0
        {
            return nil
        }
        else
        {
            return pageContentViewController(atIndex: currentIndex-1)
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return messageContents.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
 

}

