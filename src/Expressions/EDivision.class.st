"
[  (EDivision new numerator: (EConstant value: 4) ; denominator: (EConstant value: 0)) evaluate ]
		on: EZeroDenominator
		do: [ :exception |  self halt. ""we do not know what to do...."" ] 
"
Class {
	#name : #EDivision,
	#superclass : #EExpression,
	#instVars : [
		'numerator',
		'denominator'
	],
	#category : #Expressions
}

{ #category : #accessing }
EDivision >> denominator: anInteger [ 
	denominator := anInteger
]

{ #category : #evaluation }
EDivision >> evaluateWith: anObject [
	| denom |
	denom := denominator evaluateWith: Dictionary new.
	denom isZero
		ifTrue: [ EZeroDenominator signal ].
	^ (numerator evaluateWith: Dictionary new) / denom
]

{ #category : #accessing }
EDivision >> numerator: anInteger [ 
	numerator := anInteger
]

{ #category : #evaluation }
EDivision >> printOn: aStream [
	
	aStream 
		nextPutAll: '( ';
		nextPutAll: numerator printString; 
		nextPutAll: ' / ';
		nextPutAll: denominator printString;
		nextPutAll: ' )'
]
