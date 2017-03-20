Class {
	#name : #SL0Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SL0Player >> name [
	^ name
]

{ #category : #accessing }
SL0Player >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SL0Player >> position [
	^ position
]

{ #category : #accessing }
SL0Player >> position: anObject [
	position := anObject
]

{ #category : #printing }
SL0Player >> printOn: aStream [

	aStream nextPutAll: '<', name , '>'
]
