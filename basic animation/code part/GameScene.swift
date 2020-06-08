//
//  GameScene.swift
//  basic animation
//
//  Created by admin on 13/05/2020.
//  Copyright © 2020 DenysPashkov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	private var shape1 : SKShapeNode!
	private var shape2 : SKShapeNode!
	
	private var text1 : SKLabelNode!
	private var text2 : SKLabelNode!
    
    override func sceneDidLoad() {
		
		initializeText()
		initializeButtons()
        
    }
	
///		Initialize Text
	private func initializeText(){

//		Select Font
		text1 = SKLabelNode(fontNamed: "ArialRoundedMTBold")
		text1.zPosition = 1
//		Giving a identificable name for later
		text1.name = "text_1"
//		Text Position
		text1.position = CGPoint(x: -frame.size.width / 9, y: frame.size.height / 4 )
//		Font Size
		text1.fontSize = 60
//		Text inside
		text1.text = "Hello"
//		Color
		text1.fontColor = SKColor.white
		
		text2 = SKLabelNode(fontNamed: "ArialRoundedMTBold")
		text2.zPosition = 1
		text2.name = "text_2"
		text2.position = CGPoint(x: frame.size.width / 9, y: frame.size.height / 4 )
		text2.fontSize = 60
		text2.text = "Guys"
		text2.fontColor = SKColor.white
		
//		Add childs
		self.addChild(text1)
		self.addChild(text2)
		
	}
	
///		Initialize Buttons
	private func initializeButtons(){
		
		shape1 = SKShapeNode()
//		Giving the shape a name for understand if we clicked on it
		shape1.name = "button_1"
		shape1.zPosition = 1
//		Shape position
		shape1.position = CGPoint(x: -frame.size.width / 6, y: -frame.size.height / 6 )
//		Shape color
		shape1.fillColor = SKColor.green
		
//		custom button shape (triangle in this case)
		let topCorner = CGPoint(x: -50, y: 50)
		let bottomCorner = CGPoint(x: -50, y: -50)
		let middle = CGPoint(x: 50, y: 0)
		let path = CGMutablePath()
		path.addLine(to: topCorner)
		path.addLines(between: [topCorner, bottomCorner, middle])
		
		shape1.path = path
		
//		The second shape will be a cube so there's no need to have a custom chape path
		shape2 = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
		shape2.name = "button_2"
		shape2.zPosition = 1
		shape2.position = CGPoint(x: frame.size.width / 6, y: -frame.size.height / 6 )
		shape2.fillColor = SKColor.red
		
		self.addChild(shape1)
		self.addChild(shape2)
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//		for every touch that has been made
		for touch in touches {
//			check the position of the touch
			let location = touch.location(in: self)
//			and check what node is in that position
			let touchedNode = self.nodes(at: location)
//			then for every node it check if is one of the node that
//			we have created and lounch an animation acordingly
			for node in touchedNode {
				if node.name == text1.name {
					animateText1()
				} else if node.name == text2.name {
					animateText2()
				} else if node.name == shape1.name {
					animateShape1()
				} else if node.name == shape2.name {
					animateShape2()
				}
			}
		}
	}
	
///		text1 animation
	private func animateText1(){
		
//		create the animation for move the text to the center of the screen
		let animation1 = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1)
//		create the animation for scale the text
		let animation2 = SKAction.scale(by: 2, duration: 1)
		
//		ask text1 to run the move animation
		text1.run(animation1)
//		ask text1 to run the scale animation
		text1.run(animation2)
		
	}
	
///		text2 animation
	private func animateText2(){
		
//		create the animation for fade out of screen
		let animation1 = SKAction.fadeOut(withDuration: 0.5)
//		to move the center of the screen but a little bit lower
		let animation2 = SKAction.move(to: CGPoint(x: 0, y: -100), duration: 0.5)
//		create the animation for fade in on the screen
		let animation3 = SKAction.fadeIn(withDuration: 0.5)
//		combine all the animation in a unique sequence
		let sequence = SKAction.sequence([animation1,animation2,animation3])
		
//		ask text2 to run the animations in sequence
		text2.run(sequence)
		
	}
	
///		shape1 animation
	private func animateShape1(){
		
//		create the animation for move the text to the center of the screen
		let animation1 = SKAction.scale(by: 0, duration: 0.5)
//		scale up the object before the other animation
		let animation2 = SKAction.scale(by: 1.1, duration: 0.1)
		
//		create a sequence of animations
		let sequence = SKAction.sequence([animation2,animation1])
//		ask shape1 to run the animations in sequence
		shape1.run(sequence)
		
	}
	
///		shape2 animation
	private func animateShape2(){
		
//		create the animation for move the text to the center of the screen
		let animation1 = SKAction.scale(by: 14, duration: 1.5)
//		move to the center of the screen
		let animation2 = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.75)
		
//		ask text1 to run the animations in the same moment
		shape2.run(animation1)
		shape2.run(animation2)
		
		
	}
	
}
