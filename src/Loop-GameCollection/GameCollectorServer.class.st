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
GameCollectorServer >> create: aRequest [
	collector addGame: (GameItem new title: (aRequest at: #input)).
	^ ZnResponse new
		statusLine: ZnStatusLine ok;
		entity: (ZnEntity html: 'Created!');
		yourself
]

{ #category : #initialize }
GameCollectorServer >> edit: request [
	| title page |
	title := 'Enter a title'.
	page := ZnHtmlOutputStream
		streamContents: [ :html | 
			html
				page: 'Create game named'
				do: [ html
						tag: #form
						attributes:
							#(#action 'create' 'accept-charset' 'utf-8' #method #GET)
						do: [ html
								str: 'Title';
								space;
								tag: #input
									attributes:
									{#type.
									#input.
									#name.
									#input.
									#value.
									title};
								space;
								tag: #input attributes: #(#type #submit) ] ] ].
	^ ZnResponse new
		statusLine: ZnStatusLine ok;
		entity: (ZnEntity html: page);
		yourself
]

{ #category : #initialize }
GameCollectorServer >> games [
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
		GET: '/games' -> [:reg | (self htmlListFor: self games)];
		output: #html;
		GET:
			'/findDetails/<title>' -> [ :req | collector findMatchingTitle: (req at: #title) ];
		output: #json;
		GET:
			'/find/<title>'
				-> [ :req | 
					TeaResponse ok
						body:
							(self
								htmlListFor: (collector findMatchingTitle: (req at: #title))) ];
		output: #html;
		GET: '/add' -> [ :req | self edit: req ];
		GET: '/create' -> (Send message: #create: to: self)
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
