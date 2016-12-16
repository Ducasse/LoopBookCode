"
gc := GameCollectorServer serveOn: 8888.


GameCollectorServer allInstances do: #stop.
Teapot allInstances do: #stop
"
Class {
	#name : #GameCollectorServer,
	#superclass : #Object,
	#instVars : [
		'port',
		'teapot',
		'collector'
	],
	#category : #'Loop-GameCollection'
}

{ #category : #'instance creation' }
GameCollectorServer class >> serveOn: portNumber [
	^ self new  
		initializePort: portNumber;
		start
]

{ #category : #initialize }
GameCollectorServer >> games [

	^ collector games
]

{ #category : #initialize }
GameCollectorServer >> games: aRequest [

	^ collector games
]

{ #category : #initialize }
GameCollectorServer >> htmlListFor: aList [

	^ (String
			streamContents: [ :s | 
					aList
						do: [ :each | s nextPutAll: each printString ]
						separatedBy: [ s nextPutAll: '<br>' ] ])
]

{ #category : #initialize }
GameCollectorServer >> initializePort: anInteger [
	collector := GameCollector current.
	teapot := Teapot configure: { 
		#port -> anInteger. 
		#debugMode -> true. 
		#defaultOutput -> #json 
	}.
	^ self 
		registerRoutes;
		yourself
]

{ #category : #initialize }
GameCollectorServer >> registerRoutes [
	teapot
		GET: '/' -> '<h1>My game collection</h1>';
		output: #html;
		GET: '/games' -> self games;
		GET:
			'/findDetails/<title>'
				-> [ :req | collector findMatchingTitle: (req at: #title) ];
		output: #json;
		GET:
			'find/<title>'
				-> [ :req | 
					TeaResponse ok
						body: (self htmlListFor: (collector findMatchingTitle: (req at: #title))) ];
		output: #html
]

{ #category : #'start/stop' }
GameCollectorServer >> start [
	teapot start.
	^ self
]

{ #category : #'start/stop' }
GameCollectorServer >> stop [
	teapot stop
]