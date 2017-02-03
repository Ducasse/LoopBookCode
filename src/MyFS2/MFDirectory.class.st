Class {
	#name : #MFDirectory,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'files'
	],
	#category : #MyFS2
}

{ #category : #initialization }
MFDirectory >> addElement: aFile [
	aFile parent: self. 
	files add: aFile
]

{ #category : #initialization }
MFDirectory >> children [
	^ files
]

{ #category : #initialization }
MFDirectory >> initialize [
	files := OrderedCollection new
]

{ #category : #initialization }
MFDirectory >> name: aString [
	name := aString
]

{ #category : #initialization }
MFDirectory >> parent [
	^ parent
]

{ #category : #initialization }
MFDirectory >> parent: aFile [
	parent := aFile
]

{ #category : #printing }
MFDirectory >> printOn: aStream [
	parent isNil 
		ifTrue: [ aStream << '/' ]
		ifFalse: [ parent printOn: aStream ].
	aStream << name.
	aStream << '/'
]

{ #category : #size }
MFDirectory >> size [
	| sum |
	sum := 0.
	files do: [ :each | sum := sum + each size ].
	sum := sum + name size.
	sum := sum + 2.
	^ sum
]
