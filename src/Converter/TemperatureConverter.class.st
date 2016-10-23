Class {
	#name : #TemperatureConverter,
	#superclass : #Object,
	#category : #Converter
}

{ #category : #convert }
TemperatureConverter >> convertCelsius: anInteger [ 
	"Convert anInteger from celcius to fahrenheit"
	
	^ ((anInteger * 1.8) + 32) round: 1
]

{ #category : #convert }
TemperatureConverter >> convertFarhenheit: anInteger [ 
	"Convert anInteger from fahrenheit to celcius"
	
	^ ((anInteger - 32) / 1.8) round: 1
]

{ #category : #convert }
TemperatureConverter >> convertFarhenheitFrom: low to: high by: step [ 
	"Returns pairs (f, c) for all the farhenheit temperatures from a low to an high temperature"
	
	^ (low to: high by: step)
		collect: [ :f | f -> (self convertFarhenheit: f) ]
]
