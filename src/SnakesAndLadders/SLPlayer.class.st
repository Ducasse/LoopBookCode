Class {
	#name : #SLPlayer,
	#superclass : #Object,
	#instVars : [
		'name',
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLPlayer >> name: aString [ 
	name := aString
]

{ #category : #accessing }
SLPlayer >> position [
	^ position
]

{ #category : #accessing }
SLPlayer >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLPlayer >> printOn: aStream [

	aStream << '<' << name << '>'
]
