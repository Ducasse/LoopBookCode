Class {
	#name : #AdditionTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
AdditionTest >> testEvaluate [

	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2) evaluate equals: 8
	
]

{ #category : #tests }
AdditionTest >> testEvaluateWithNegation [

	| ep1 ep2 |
	ep1 := ENegation new expression: (EConstant new value:5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2) evaluate equals: -2
	
]

{ #category : #tests }
AdditionTest >> testPrinting [

	self assert: (EAddition fivePlusThree) negated printString equals:  '- ( 5 + 3 )'
]
