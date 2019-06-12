Class {
	#name : #IDWCollaborationNetwork,
	#superclass : #WAComponent,
	#instVars : [
		'requests',
		'newRequest'
	],
	#category : #IDWCollaborationNetwork
}

{ #category : #'as yet unclassified' }
IDWCollaborationNetwork >> displayRequests: html [
	requests do: [ :req |
		self renderCNRequest: html req: req. 
		 ]
]

{ #category : #initialization }
IDWCollaborationNetwork >> initialize [ 
	super initialize .
	newRequest := IDWCollaborationNetworkRequest new user: self session user.
	requests := OrderedCollection new.
]

{ #category : #rendering }
IDWCollaborationNetwork >> renderCNRequest: html req: req [
	html break.
	html text: 'TITLE'. html text: req title.
	html break.
	html text: 'CONTENT: '. html text: req content.
	
]

{ #category : #rendering }
IDWCollaborationNetwork >> renderContentOn: html [
	html heading level4 with: 'Collaboration Network' .
	self session isLoggedIn ifTrue: [
		self renderNewRequestForm: html. 
		self displayRequests: html 
		]
]

{ #category : #rendering }
IDWCollaborationNetwork >> renderNewRequestForm: html [
	html break. 
	html strong: 'New Request'. html break.
	html form: [ 
		 html textInput callback: [ :value | newRequest title: value ] ].
	html text: 'Target Network '.
        html select 
            list: #(#Close #Near);
            selected: newRequest destination;
            callback: [ :value |
                newRequest destination: value ].
        html break.
	html submitButton callback: [ requests add: newRequest. newRequest := IDWCollaborationNetworkRequest new user: self session  ]
]
