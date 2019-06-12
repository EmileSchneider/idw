Class {
	#name : #IDWSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'users'
	],
	#category : #IDW
}

{ #category : #'as yet unclassified' }
IDWSession >> allUsers [
	^ users.
]

{ #category : #'as yet unclassified' }
IDWSession >> initialize [ 
	super initialize .
	users := OrderedCollection new .	
]

{ #category : #testing }
IDWSession >> isLoggedIn [
	^ user isNil not 
]

{ #category : #'as yet unclassified' }
IDWSession >> login: email password: pwd [ 
	users do: [ :u | 
		u email = email ifTrue: [ 
			u password = pwd ifTrue: [ 
				 user := u ] ] ].
]

{ #category : #'as yet unclassified' }
IDWSession >> logout [
	user := nil
]

{ #category : #'as yet unclassified' }
IDWSession >> registerUser: userName password: password email: email [ 
	| newUser |
	newUser := IDWUser new .
	newUser userName: userName .
	newUser email: email .
	newUser password: password .
	users add: newUser .
	
]

{ #category : #accessing }
IDWSession >> user [ 	
	^ user
]
