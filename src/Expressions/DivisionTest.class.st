Class {
	#name : #DivisionTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
DivisionTest >> testEvaluateNoError [

	self assert: (EDivision new numerator: (EConstant value: 4) ; denominator: (EConstant value: 2)) evaluate equals: 2
]

{ #category : #tests }
DivisionTest >> testEvaluateWithError [

	self 
		should: [ (EDivision new numerator: (EConstant value: 4) ; denominator: (EConstant value: 0)) evaluate ]
		raise: EZeroDenominator 
]
