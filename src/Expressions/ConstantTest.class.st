Class {
	#name : #ConstantTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
ConstantTest >> testEvaluate [ 
	
	self assert:(EConstant new value: 5) evaluate equals: 5
	

]

{ #category : #tests }
ConstantTest >> testPrinting [
	
	self assert:(EConstant new value: 5) printString equals: '5'.
	
]

{ #category : #tests }
ConstantTest >> testValue [ 
	
	self assert:(EConstant new value: 5) value equals:5.
	self assert:(EConstant constant5) value equals:5
	

]

{ #category : #tests }
ConstantTest >> testValueFromClass [
	
	self assert:(EConstant value: 5) value equals: 5.

	

]
