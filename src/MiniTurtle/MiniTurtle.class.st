"
A simple implementation of a turtle
"
Class {
	#name : #MiniTurtle,
	#superclass : #Morph,
	#instVars : [
		'direction'
	],
	#category : 'MiniTurtle'
}

{ #category : #operations }
MiniTurtle >> direction [

	^ direction
]

{ #category : #drawing }
MiniTurtle >> drawOn: aCanvas [
	"self new openInWorld" 

	| headLength center |
	center := self center.
	headLength := self height // 2 - 2.
	aCanvas 
		fillOval: (Rectangle center: center extent: (self height - 10) @ (self height - 10))
		color: self color.
	aCanvas
		line: center
		to: (self positionInDirectionForDistance: headLength)
		width: 1
		color: Color black

]

{ #category : #operations }
MiniTurtle >> go: distance [
	"make the receiver goes forward from a given distance"

	self goAt: (self positionInDirectionForDistance: distance)
]

{ #category : #operations }
MiniTurtle >> goAt: aPoint [
	"Make the receiver go at a given point of the screen. The receiver lets a trace on the screen from its current position to the final point. "
	
 	self owner canvas line: self center to: aPoint color: Color black.
 	self jumpAt: aPoint.
]

{ #category : #initialization }
MiniTurtle >> initialize [
	"initialize the instance variable of newly created object"
	"self new openInWorld"

	super initialize.
	self extent: 50 @ 50.
   	direction := 0.
   	self color: (Color r: 1.0 g: 0.097 b: 0.774)
]

{ #category : #operations }
MiniTurtle >> jump: distance [
	"make the receiver goes forward from a given distance but without making a trace on 	the screen"

	self jumpAt: (self positionInDirectionForDistance: distance)
]

{ #category : #operations }
MiniTurtle >> jumpAt: aPoint [
	"changes the receiver position so that its center is placed at the position aPoin"

	self center: aPoint
]

{ #category : #operations }
MiniTurtle >> positionInDirectionForDistance: aDistance [
	"return the point that is at a distance aDistance in the direction pointed by the receiver"

	^ self center + (direction degreeCos @ direction degreeSin negated * aDistance) asIntegerPoint 
]

{ #category : #operations }
MiniTurtle >> turn: degrees [
	"change the direction of the receiver by a certain degrees. Like in basic trigonometry, 	when degrees is a positive number the direction changes anticlockwise, when the 	degrees 	is a negative number the  direction changes clockwise"
	

	direction := direction + degrees.
	self changed.
]

{ #category : #operations }
MiniTurtle >> turnLeft: degrees [
	"changes to direction from a given amount of degrees to the left of the current receiver 	direction"

	self turn: degrees
]

{ #category : #operations }
MiniTurtle >> turnRight: degrees [
	"changes to direction from a given amount of degrees to the right of the current 	receiver direction"

	self turn: degrees negated
]
