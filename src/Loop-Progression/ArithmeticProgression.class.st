Class {
	#name : 'ArithmeticProgression',
	#superclass : 'Object',
	#instVars : [
		'current',
		'increment'
	],
	#category : 'Loop-Progression',
	#package : 'Loop-Progression'
}

{ #category : 'accessing' }
ArithmeticProgression >> firstValue: anInteger [ 
	current := anInteger
]

{ #category : 'accessing' }
ArithmeticProgression >> increment: anInteger [ 
	increment := anInteger
]

{ #category : 'converting' }
ArithmeticProgression >> nextValue [
	current := current + increment.
	^ current
]
