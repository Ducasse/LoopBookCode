Class {
	#name : #EAddition,
	#superclass : #EExpression,
	#instVars : [
		'right',
		'left'
	],
	#category : #Expressions
}

{ #category : #examples }
EAddition class >> fivePlusThree [
	<sampleInstance>
	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	^ self new right: ep1; left: ep2
]

{ #category : #evaluation }
EAddition >> evaluate [

	^  right evaluate +  left evaluate
]

{ #category : #accessing }
EAddition >> left: anEConstant [ 
	left := anEConstant
]

{ #category : #accessing }
EAddition >> right: anEConstant [ 
	right := anEConstant
]
