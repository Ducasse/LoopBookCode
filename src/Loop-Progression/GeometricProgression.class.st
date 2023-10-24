Class {
	#name : 'GeometricProgression',
	#superclass : 'Object',
	#instVars : [
		'current',
		'increment'
	],
	#category : 'Loop-Progression-',
	#package : 'Loop-Progression',
	#tag : ''
}

{ #category : 'accessing' }
GeometricProgression >> firstValue: anInteger [ 
	current := anInteger
]

{ #category : 'accessing' }
GeometricProgression >> increment: anInteger [ 
	increment := anInteger
]

{ #category : 'converting' }
GeometricProgression >> nextValue [
	current := current * increment.
	^ current
]
