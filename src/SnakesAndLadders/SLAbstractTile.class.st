Class {
	#name : #SLAbstractTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLAbstractTile >> position [
	^ position
]

{ #category : #accessing }
SLAbstractTile >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLAbstractTile >> printOn: aStream [

	aStream << '['.
	aStream << position printString.
	aStream << ']'
]
