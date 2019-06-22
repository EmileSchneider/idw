Class {
	#name : #IDWMessage,
	#superclass : #WAComponent,
	#instVars : [
		'sender',
		'text',
		'messages',
		'newMsg'
	],
	#category : #IDWStudyGroups
}

{ #category : #'as yet unclassified' }
IDWMessage >> createNewMsg [
	newMsg := IDWMessage new .
]

{ #category : #initialization }
IDWMessage >> initialize [
	super initialize .
	messages := OrderedCollection new .
	
	
]

{ #category : #accessing }
IDWMessage >> messages [
	^ messages
]

{ #category : #accessing }
IDWMessage >> messages: anObject [
	messages := anObject
]

{ #category : #rendering }
IDWMessage >> renderContentOn: html [
	html text: ' a message from '	. html text: sender . html break .
	html text: text .
	self renderReplys: html .
	html form: [ 
		html submitButton callback: [ self createNewMsg ]; with: 'create message' ].
	newMsg isNotNil ifTrue: [ 
		self renderNewMessageForm: html ]
]

{ #category : #rendering }
IDWMessage >> renderNewMessageForm: html [
	html form: [ 
		html textInput callback: [ :v | newMsg text: v ].
		html submitButton callback: [ messages add: newMsg. self createNewMsg  ]; with: 'add message' ]
]

{ #category : #rendering }
IDWMessage >> renderReplys: html [ 
	| counter |
	counter := 0.
	html text: 'replys '. html break .
	messages do: [ :msg |
		html text: counter .
		counter := counter + 1.
		html render: msg. ]
]

{ #category : #accessing }
IDWMessage >> sender [
	^ sender
]

{ #category : #accessing }
IDWMessage >> sender: anObject [
	sender := anObject
]

{ #category : #accessing }
IDWMessage >> text [
	^ text
]

{ #category : #accessing }
IDWMessage >> text: anObject [
	text := anObject
]
