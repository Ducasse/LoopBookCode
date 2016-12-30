Class {
	#name : #EMultiplication,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #examples }
EMultiplication class >> fiveTimesThree [

	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
   ^ EMultiplication new right: ep1; left: ep2
]

{ #category : #evaluation }
EMultiplication >> evaluate [
	
	^ left evaluate * right evaluate
]

{ #category : #evaluation }
EMultiplication >> left: anEConstant [
	left := anEConstant
	
	
]

{ #category : #evaluation }
EMultiplication >> negated [

	^ ENegation new expression: self
]

{ #category : #evaluation }
EMultiplication >> right: anEConstant [
	right := anEConstant
	
]
