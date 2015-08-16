//
//  TransitionManager.swift
//  iPuntos
//
//  Created by ArshAulakh on 19/07/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
	var presenting = false
	
	// MARK: UIViewControllerAnimatedTransitioning
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		let container = transitionContext.containerView()
		let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
		let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
		
		let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
		let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
		
		if presenting {
			toView.transform = offScreenRight
		} else {
			toView.transform = offScreenLeft
		}

		container.addSubview(toView)
		container.addSubview(fromView)
		
		let duration = self.transitionDuration(transitionContext)
		animationDuration = duration
		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveEaseInOut, animations: {
				if self.presenting {
					fromView.transform = offScreenLeft
				} else {
					fromView.transform = offScreenRight
				}
				toView.transform = CGAffineTransformIdentity
			}, completion: { finished in
				transitionContext.completeTransition(true)
		})
	}
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
		return animationDuration * 0.75
	}
	
	// MARK: UIViewControllerTransitioningDelegate protocol methods
	func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = true
		return self
	}
	
	func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = false
		return self
	}
}
