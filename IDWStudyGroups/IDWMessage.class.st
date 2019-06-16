Class {
	#name : #IDWMessage,
	#superclass : #WAComponent,
	#instVars : [
		'sender',
		'text',
		'messages'
	],
	#category : #IDWStudyGroups
}

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
