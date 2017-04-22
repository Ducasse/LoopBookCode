Class {
	#name : #TemperatureLogger,
	#superclass : #Object,
	#instVars : [
		'location',
		'measures'
	],
	#category : #TemperatureLogger
}

{ #category : #initialization }
TemperatureLogger >> initialize [

	location := 'Home'.
	measures := OrderedCollection new. 
]

{ #category : #accessing }
TemperatureLogger >> location: aString [

	location := aString
]

{ #category : #operation }
TemperatureLogger >> recordCount [

	^ measures size
]

{ #category : #operation }
TemperatureLogger >> recordTemperature: aNumber [
	"Add the temperature to the list of recorded measures"
	measures add: aNumber
]
