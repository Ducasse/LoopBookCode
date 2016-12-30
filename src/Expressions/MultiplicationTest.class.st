Class {
	#name : #MultiplicationTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
MultiplicationTest >> testEvaluate [

	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EMultiplication new right: ep1; left: ep2) evaluate equals: 15
]

{ #category : #tests }
MultiplicationTest >> testEvaluateNegated [

	self assert: (EMultiplication fiveTimesThree) evaluate negated equals: -15
]

{ #category : #tests }
MultiplicationTest >> testPrinting [

	self assert: (EMultiplication fiveTimesThree) negated printString equals:  '- ( 5 * 3 )'
]
