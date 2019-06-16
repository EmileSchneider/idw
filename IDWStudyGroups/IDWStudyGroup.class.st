Class {
	#name : #IDWStudyGroup,
	#superclass : #WAComponent,
	#instVars : [
		'groupName',
		'members',
		'messages',
		'newMsg'
	],
	#category : #IDWStudyGroups
}

{ #category : #'as yet unclassified' }
IDWStudyGroup >> createNewMessage [
	newMsg := IDWMessage new sender: self session user
]

{ #category : #accessing }
IDWStudyGroup >> groupName [
	^ groupName
]

{ #category : #accessing }
IDWStudyGroup >> groupName: anObject [
	groupName := anObject
]

{ #category : #initialization }
IDWStudyGroup >> initialize [
	super initialize.
	messages := OrderedCollection new.
]

{ #category : #accessing }
IDWStudyGroup >> members [
	^ members
]

{ #category : #accessing }
IDWStudyGroup >> members: anObject [
	members := anObject
]

{ #category : #accessing }
IDWStudyGroup >> messages [
	^ messages
]

{ #category : #accessing }
IDWStudyGroup >> messages: anObject [
	messages := anObject
]

{ #category : #rendering }
IDWStudyGroup >> renderContentOn: html [ 
	html text: ' A Group called '. html text: groupName . html break.
	html text: ' all msg: '. html break.
	self session isLoggedIn ifTrue: [  
		self renderNewMessageForm: html .
		 ].
	messages do: [ :msg |
		html render: msg. html break. ]
	
]

{ #category : #rendering }
IDWStudyGroup >> renderNewMessageForm: html [
	html text: 'New Message'. 
	html form: [ 
		html textInput callback: [ :value | 
			newMsg isNotNil 
			ifTrue: [ 
				newMsg text: value ] 
			ifFalse: [
				self createNewMessage. 
				newMsg text: value.]] .
			
		html submitButton callback: [
			messages add: newMsg . self createNewMessage . ]
		;with: 'Send new message'. ]
]
