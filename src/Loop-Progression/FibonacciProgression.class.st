Class {
	#name : 'FibonacciProgression',
	#superclass : 'Object',
	#instVars : [
		'first',
		'second'
	],
	#category : 'Loop-Progression-',
	#package : 'Loop-Progression',
	#tag : ''
}

{ #category : 'accessing' }
FibonacciProgression >> firstValue: anInteger [ 
	first := anInteger
]

{ #category : 'converting' }
FibonacciProgression >> nextValue [
	| nextValue |
	nextValue := second + first.
	first := second.
	second := nextValue.
	^ nextValue
]

{ #category : 'api - adding' }
FibonacciProgression >> second: anInteger [ 
	second := anInteger
]
