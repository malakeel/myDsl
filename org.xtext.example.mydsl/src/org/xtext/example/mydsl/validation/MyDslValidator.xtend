/*
 * generated by Xtext 2.10.0
 */
package org.xtext.example.mydsl.validation

import org.xtext.example.mydsl.myDsl.SuiteDeclaration
import org.eclipse.xtext.validation.Check
import org.xtext.example.mydsl.myDsl.MyDslPackage

/**
 * This class contains custom validation rules. 
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class MyDslValidator extends AbstractMyDslValidator {

//	public static val INVALID_NAME = 'invalidName'
//
//	@Check
//	def checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.name.charAt(0))) {
//			warning('Name should start with a capital', 
//					MyDslPackage.Literals.GREETING__NAME,
//					INVALID_NAME)
//		}
//	}
	@Check
	def checkSuiteName(SuiteDeclaration suite) {
		if (!Character.isUpperCase(suite.name.charAt(0))) {
			warning("Suite name must be Capitalized", MyDslPackage.Literals.SUITE_DECLARATION__NAME, "issue 1")
		}
	}

}
