Class {
	#name : #TemperatureLogger,
	#superclass : #Object,
	#instVars : [
		'location',
		'temperatures'
	],
	#category : #Thermometer
}

{ #category : #accessing }
TemperatureLogger >> average [
	
	|sum|
	sum :=0.
	self temperatures do:  [ :each | sum := sum + each value ].
	^ sum / (self temperatures size)
]

{ #category : #initialization }
TemperatureLogger >> initialize [
	
	self location: ''.
	self temperatures: OrderedCollection new.
	
]

{ #category : #accessing }
TemperatureLogger >> lastTemperature [

	^ self temperatures last.
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> location [
	^ location
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> location: aString [ 
	location := aString
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> recordTemperature: anInteger [ 
	self temperatures add: (DateAndTime now) -> anInteger.
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> temperatures [
	^ temperatures
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> temperatures: anOrderedCollection [ 
	temperatures := anOrderedCollection
]
