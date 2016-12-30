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
   ^ EMultiplication new left: ep1 ; right: ep2 
]

{ #category : #'instance creation' }
EMultiplication class >> left: anInteger right: anInteger2 [

	^ self new left: anInteger ; right: anInteger2
]

{ #category : #evaluation }
EMultiplication >> evaluate [
	
	^ left evaluate * right evaluate
]

{ #category : #evaluation }
EMultiplication >> left: anEConstant [
	left := anEConstant
	
	
]

{ #category : #printing }
EMultiplication >> printOn: aStream [
	
	aStream 
		nextPutAll: '( ';
		nextPutAll: left printString; 
		nextPutAll: ' * ';
		nextPutAll: right printString;
		nextPutAll: ' )'
]

{ #category : #evaluation }
EMultiplication >> right: anEConstant [
	right := anEConstant
	
]
