Class {
	#name : 'GeometricProgressionTest',
	#superclass : 'TestCase',
	#category : 'Loop-Progression',
	#package : 'Loop-Progression'
}

{ #category : 'tests' }
GeometricProgressionTest >> testIncrementOfThree [

	| geo |
	geo := GeometricProgression new.
	geo 
		firstValue: 1;
		increment: 3.
	self assert: geo nextValue equals: 3.
	self assert: geo nextValue equals: 9.
]

{ #category : 'tests' }
GeometricProgressionTest >> testIncrementOfThreeTo5 [

	| geo |
	geo := GeometricProgression new.
	geo 
		firstValue: 5;
		increment: 3.
	self assert: geo nextValue equals: 15.
	self assert: geo nextValue equals: 45.
]
