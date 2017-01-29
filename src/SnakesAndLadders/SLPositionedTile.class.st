Class {
	#name : #SLPositionedTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #'as yet unclassified' }
SLPositionedTile >> enterTile [

	
]

{ #category : #testing }
SLPositionedTile >> isLadder [ 

	^ false
]

{ #category : #testing }
SLPositionedTile >> isSnake [

	^ false
]

{ #category : #testing }
SLPositionedTile >> isSnaker [

	^ false
]

{ #category : #accessing }
SLPositionedTile >> position [
	^ position
]

{ #category : #accessing }
SLPositionedTile >> position: anObject [
	position := anObject
]

{ #category : #printing }
SLPositionedTile >> printOn: aStream [

	aStream << '['.
	self printOnInside: aStream.
	aStream << ']'
]

{ #category : #printing }
SLPositionedTile >> printOnInside: aStream [


	aStream << position printString.

]
