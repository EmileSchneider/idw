Class {
	#name : #IDWControllBar,
	#superclass : #WAComponent,
	#category : #IDW
}

{ #category : #rendering }
IDWControllBar >> renderContentOn: html [
	html heading level: 3; with: 'ControllBar' .
	self session isLoggedIn 
	ifTrue: [ 
		 html strong: 'loggedIn'.
		 html break.
		html anchor callback: [ self session logout ]; with: 'logout'.
		];
	ifFalse: [ 
		html strong: 'NOT loggedIn'
		 ]
	
]
