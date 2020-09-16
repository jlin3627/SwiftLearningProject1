//
//  ViewController.swift
//  Test1
//
//  Created by Jing Yee Lin on 9/16/20.
//  Copyright © 2020 Jing Yee Lin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{

	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var btnTitle: UIButton!

	var catSound: AVAudioPlayer = AVAudioPlayer()


	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		btnTitle.imageView?.contentMode = .scaleAspectFit

		let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")

		do
		{
			// ! <- tell us the file might be empty
			try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
		}
		catch
		{
			print(error)
		}
	}

	@IBAction func btnTitleTouchUp(_ sender: Any)
	{
		lblTitle.isHidden = false;

		catSound.play()

		Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
	}

	@objc func hideLabel()
	{
		lblTitle.isHidden = true
	}
}

