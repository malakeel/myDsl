package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.xtext.example.mydsl.myDsl.UIElement

class MyDslCompiler extends XbaseCompiler {

	override protected internalToConvertedExpression(XExpression obj, ITreeAppendable appendable) {
		if (obj instanceof UIElement) {
			appendable.append("new ").append(Runnable).append("() {").newLine
//			appendable.increaseIndentation
//			appendable.append("public void run()").newLine
			reassignThisInClosure(appendable, null)
			internalToJavaStatement(obj.block, appendable, false)
			appendable.newLine
//			appendable.decreaseIndentation
			appendable.newLine.append("}")
		} else {
			super.internalToConvertedExpression(obj, appendable)
		}
		
		
	}

}
