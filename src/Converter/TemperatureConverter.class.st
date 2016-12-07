"
I'm temperature converter. I convert celcius and farhenheit. 
In addition, I can also be ued to record temperatures over a period.

[[[
TemperatureConverter new 
	convertFahrenheit: 58
]]]
"
Class {
	#name : #TemperatureConverter,
	#superclass : #Object,
	#instVars : [
		'location',
		'records'
	],
	#category : #Converter
}

{ #category : #convert }
TemperatureConverter >> convertCelsius: anInteger [ 
	"Convert anInteger from celcius to fahrenheit"
	
	^ ((anInteger * 1.8) + 32)
]

{ #category : #convert }
TemperatureConverter >> convertFahrenheit: anInteger [ 
	"Convert anInteger from fahrenheit to celcius"
	
	^ ((anInteger - 32) / 1.8)
]

{ #category : #convert }
TemperatureConverter >> convertFahrenheitFrom: low to: high by: step [ 
	"Returns a collection of pairs (f, c) for all the farhenheit temperatures from a low to an high temperature"

	^ (low to: high by: step)
		collect: [ :f | f -> (self convertFahrenheit: f) ]
]

{ #category : #measuring }
TemperatureConverter >> dates [

	^ self records collect: [ :each | each key asDate ]
]

{ #category : #initialization }
TemperatureConverter >> initialize [
	location := 'Nice'.
	records := OrderedCollection new
]

{ #category : #accessing }
TemperatureConverter >> location [

	^ location 
]

{ #category : #accessing }
TemperatureConverter >> location: aLocation [

	location := aLocation
]

{ #category : #measuring }
TemperatureConverter >> measureCelsius: aTemp [

	records add: DateAndTime now -> aTemp
]

{ #category : #measuring }
TemperatureConverter >> measureCount [

	^ records size
]

{ #category : #measuring }
TemperatureConverter >> measureFahrenheit: aTemp [

	records add: DateAndTime now -> (self convertFahrenheit: aTemp)
]

{ #category : #accessing }
TemperatureConverter >> records [

	^ records
]

{ #category : #measuring }
TemperatureConverter >> temperatures [

	^ self records collect: [ :each | each value ]
]

{ #category : #measuring }
TemperatureConverter >> times [

	^ self records collect: [ :each | each key ]
]
