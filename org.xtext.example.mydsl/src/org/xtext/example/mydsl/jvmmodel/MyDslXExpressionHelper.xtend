package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.util.XExpressionHelper
import org.xtext.example.mydsl.myDsl.Action
import org.xtext.example.mydsl.myDsl.TestBody
import org.xtext.example.mydsl.myDsl.EventHandler
import org.xtext.example.mydsl.myDsl.InitBody

class MyDslXExpressionHelper extends XExpressionHelper {

	override hasSideEffects(XExpression expr) {
		if (expr instanceof Action) {
			val a = expr as Action;
			for (datum : a.args.data)
				println(datum)
			return true
		}

		super.hasSideEffects(expr)
	}

}
