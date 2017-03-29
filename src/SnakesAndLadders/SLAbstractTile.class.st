Class {
	#name : #SLAbstractTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #'accept/release' }
SLAbstractTile >> acceptPlayer: aPlayer [
	aPlayer position: self position. 
]

{ #category : #accessing }
SLAbstractTile >> position [
	^ position
]

{ #category : #accessing }
SLAbstractTile >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLAbstractTile >> printInsideOn: aStream [

	position printOn: aStream

]

{ #category : #printing }
SLAbstractTile >> printOn: aStream [

	aStream << '['.
	self printInsideOn: aStream.
	aStream << ']'
]
