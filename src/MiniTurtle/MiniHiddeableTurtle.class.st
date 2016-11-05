Class {
	#name : #MiniHiddeableTurtle,
	#superclass : #MiniTurtle,
	#category : #MiniTurtle
}

{ #category : #'as yet unclassified' }
MiniHiddeableTurtle >> drawOn: aCanvas [

	self visible 
		ifTrue: [ super drawOn: aCanvas ]
]

{ #category : #'as yet unclassified' }
MiniHiddeableTurtle >> initialize [

	super initialize.
	self visible: false.
]
