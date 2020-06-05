Class {
	#name : #MiniHiddeableTurtle,
	#superclass : #MiniTurtle,
	#category : #MiniTurtle
}

{ #category : #drawing }
MiniHiddeableTurtle >> drawOn: aCanvas [

	self visible 
		ifTrue: [ super drawOn: aCanvas ]
]

{ #category : #initialization }
MiniHiddeableTurtle >> initialize [

	super initialize.
	self visible: false.
]
