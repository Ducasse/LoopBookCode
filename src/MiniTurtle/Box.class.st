"
| joe  |
joe := Box new.
joe draw
"
Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'position',
		'size',
		'tilt'
	],
	#category : #MiniTurtle
}

{ #category : #'as yet unclassified' }
Box >> draw [
   "Draw the receiver position in black"
   "Box new initialize draw"
	
   | aTurtle |
   aTurtle := MiniHiddeableTurtle new openInWorld.
   aTurtle jumpAt: position.
   aTurtle turnRight: tilt.
   4 timesRepeat: [aTurtle go: size. 
                  aTurtle turnLeft: 90]
]

{ #category : #'as yet unclassified' }
Box >> initialize [
	"A box is initialized to be in the center of the screen, with 
	50 pixels size and 0 tilt"
	
	size := 200.
	tilt := 0.
	position := World bounds center
]

{ #category : #'as yet unclassified' }
Box >> size [
   ^ size
]

{ #category : #'as yet unclassified' }
Box >> size: anInteger [
   size := anInteger
]
