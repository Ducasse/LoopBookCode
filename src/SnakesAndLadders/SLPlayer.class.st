Class {
	#name : #SLPlayer,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLPlayer >> name: aString [ 
	name := aString
]

{ #category : #printing }
SLPlayer >> printOn: aStream [

	aStream << '<' << name << '>'
]
