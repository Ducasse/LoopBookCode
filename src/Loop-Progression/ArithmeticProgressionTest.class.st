Class {
	#name : 'ArithmeticProgressionTest',
	#superclass : 'TestCase',
	#category : 'Loop-Progression',
	#package : 'Loop-Progression'
}

{ #category : 'tests' }
ArithmeticProgressionTest >> c [
]

{ #category : 'tests' }
ArithmeticProgressionTest >> testIncrementOfThree [

	| arith |
	arith := ArithmeticProgression new.
	arith 
		firstValue: 0;
		increment: 3.
	self assert: arith nextValue equals: 3.
	self assert: arith nextValue equals: 6.
]

{ #category : 'tests' }
ArithmeticProgressionTest >> testIncrementOfThreeTo5 [

	| arith |
	arith := ArithmeticProgression new.
	arith 
		firstValue: 5;
		increment: 3.
	self assert: arith nextValue equals: 8.
	self assert: arith nextValue equals: 11.
	
	
	

]
