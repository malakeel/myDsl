package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.util.XExpressionHelper
import org.xtext.example.mydsl.myDsl.Action

class MyDslXExpressionHelper extends XExpressionHelper {

    override hasSideEffects(XExpression expr) {
        if (expr instanceof Action || expr.eContainer instanceof Action) {
            return true
        }
        super.hasSideEffects(expr)
    }

}