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
NegationTest >> testEvaluateWithClassCreationMessage [
	
	self assert:(ENegation expression: (EConstant value: 5)) evaluate equals: -5
	

]

{ #category : #tests }
NegationTest >> testNegated [
	
	self assert:(EConstant new value: 6) negated evaluate equals: -6.
	self assert:(EAddition fivePlusThree) negated evaluate equals: -8
	
	

]

{ #category : #tests }
NegationTest >> testNegatedStructureIsCorrect [
	
	| exp |
	exp := (EConstant new value: 6).
	self assert: exp negated class = ENegation. 
	self assert: exp negated negated equals: exp.

	
	

]

{ #category : #tests }
NegationTest >> testNegationNegated [
	
	self assert:(EConstant new value: 6) negated negated evaluate equals: 6.
	
	
	

]

{ #category : #tests }
NegationTest >> testPrinting [
	
	| exp |
	exp := (EConstant new value: 6) negated.
	self assert: exp printString = '- 6'. 
	self assert: exp negated printString = '6'. 

	
	

]
