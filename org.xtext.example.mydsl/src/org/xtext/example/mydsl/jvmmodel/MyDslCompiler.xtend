package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.eclipse.xtext.xbase.XExpression
import org.xtext.example.mydsl.myDsl.UIElement
import org.xtext.example.mydsl.myDsl.Action

class MyDslCompiler extends XbaseCompiler {

	override protected internalToConvertedExpression(XExpression obj, ITreeAppendable appendable) {
		if (obj instanceof Action) {
			println("Processed compiler expression")
		} else {
			super.internalToConvertedExpression(obj, appendable)
		}
		
		
	}

}
