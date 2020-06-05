"
I'm a simple temperature logger.


"
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

{ #category : #accessing }
TemperatureLogger >> location [
	^ location
]

{ #category : #accessing }
TemperatureLogger >> location: aString [ 
	location := aString
]

{ #category : #recording }
TemperatureLogger >> recordTemperature: anInteger [ 
	self temperatures add: (DateAndTime now) -> anInteger.
]

{ #category : #accessing }
TemperatureLogger >> temperatures [
	^ temperatures
]

{ #category : #accessing }
TemperatureLogger >> temperatures: anOrderedCollection [ 
	temperatures := anOrderedCollection
]
