Class {
	#name : #IDWUser,
	#superclass : #Object,
	#instVars : [
		'userName',
		'email',
		'password',
		'goals',
		'messages'
	],
	#category : #IDW
}

{ #category : #accessing }
IDWUser >> email [
	^ email
]

{ #category : #accessing }
IDWUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
IDWUser >> goals [
	^ goals
]

{ #category : #accessing }
IDWUser >> goals: anObject [
	goals := anObject
]

{ #category : #initialization }
IDWUser >> initialize [
	super initialize .
	goals := OrderedCollection new .
]

{ #category : #accessing }
IDWUser >> password [
	^ password
]

{ #category : #accessing }
IDWUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
IDWUser >> userName [
	^ userName
]

{ #category : #accessing }
IDWUser >> userName: anObject [
	userName := anObject
]
