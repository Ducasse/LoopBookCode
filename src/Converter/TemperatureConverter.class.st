Class {
	#name : #TemperatureConverter,
	#superclass : #Object,
	#category : #Converter
}

{ #category : #convert }
TemperatureConverter >> convertCelsius: anInteger [ 
	"Convert anInteger from celcius to fahrenheit"
	
	^ ((anInteger * 1.8) + 32)
]
