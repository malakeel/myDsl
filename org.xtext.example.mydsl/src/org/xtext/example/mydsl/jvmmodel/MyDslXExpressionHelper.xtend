package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.util.XExpressionHelper
import org.xtext.example.mydsl.myDsl.Action
import org.xtext.example.mydsl.myDsl.UIElement
import org.xtext.example.mydsl.myDsl.TestBody
import org.xtext.example.mydsl.myDsl.EventHandler
import org.xtext.example.mydsl.myDsl.InitBody

class MyDslXExpressionHelper extends XExpressionHelper {

	override hasSideEffects(XExpression expr) {
		if (expr instanceof Action || expr.eContainer instanceof Action) {
			val a = expr as Action;
//			for (datum : a.config.data)
//				println(datum)
			return true
		} else if (expr.eContainer instanceof UIElement || expr instanceof UIElement) {
			return true
		}

		switch expr {
			InitBody: {
				return true
			}
			TestBody: {
				return true
			}
			EventHandler: {
				return true
			}
			Action: {
				return true
			}
//			UIElement: {
//				return true
//			}
			default:
				super.hasSideEffects(expr)
		}
	}

}
