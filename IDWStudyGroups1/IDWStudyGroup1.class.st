Class {
	#name : #IDWStudyGroup1,
	#superclass : #Object,
	#instVars : [
		'groupName',
		'users',
		'messages'
	],
	#category : #IDWStudyGroups1
}

{ #category : #adding }
IDWStudyGroup1 >> addUser: aUser [
	users add: aUser .
]

{ #category : #accessing }
IDWStudyGroup1 >> groupName [
	^ groupName
]

{ #category : #accessing }
IDWStudyGroup1 >> groupName: anObject [
	groupName := anObject
]

{ #category : #initialization }
IDWStudyGroup1 >> initialize [
	super initialize.
	groupName := ''.
	users := OrderedCollection new.
	messages := OrderedCollection new.
]

{ #category : #accessing }
IDWStudyGroup1 >> messages [
	^ messages
]

{ #category : #accessing }
IDWStudyGroup1 >> messages: anObject [
	messages := anObject
]

{ #category : #'instance creation' }
IDWStudyGroup1 >> newMessage: aMsg [
	messages add: aMsg
]

{ #category : #rendering }
IDWStudyGroup1 >> renderContentOn: html [ 
	html heading level4 with: groupName .
	html strong: 'USERS'. html break.
	users do: [ :u |
		self renderUser: html user: u ].
	html strong: 'MESSAGES'. html break. 
	messages do: [ :m | 
		self renderMessage: html msg: m]
	
]

{ #category : #rendering }
IDWStudyGroup1 >> renderMessage: html msg: m [ 
	html text: m sender userName. 
	html text: m content.
]

{ #category : #rendering }
IDWStudyGroup1 >> renderUser: html user: u [
	html text: u userName.
]

{ #category : #accessing }
IDWStudyGroup1 >> users [
	^ users
]

{ #category : #accessing }
IDWStudyGroup1 >> users: anObject [
	users := anObject
]
