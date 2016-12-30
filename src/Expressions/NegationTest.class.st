Class {
	#name : #NegationTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
NegationTest >> testEvaluate [ 
	
	self assert:(ENegation new expression: (EConstant new value:5)) evaluate equals: -5
	

]

{ #category : #tests }
NegationTest >> testNegated [
	
	self assert:(EConstant new value: 6) negated evaluate equals: -6.
	self assert:(EAddition fivePlusThree) negated evaluate equals: -8
	
	

]
