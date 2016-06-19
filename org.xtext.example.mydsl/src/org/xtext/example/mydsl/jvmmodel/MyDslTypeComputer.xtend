package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.typesystem.computation.XbaseTypeComputer
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputationState
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceFlags
import org.xtext.example.mydsl.myDsl.UIElement
import org.xtext.example.mydsl.myDsl.Action

class MyDslTypeComputer extends XbaseTypeComputer {

	override computeTypes(XExpression expression, ITypeComputationState state) {
		if (expression instanceof Action) {
			_computeTypes(expression as Action, state);
		} else {
			super.computeTypes(expression, state)
		}
	}


	protected def void _computeTypes(Action action, ITypeComputationState state) {
		state.withExpectation(getPrimitiveVoid(state)).computeTypes(action)
		state.acceptActualType(getTypeForName(Runnable, state), ConformanceFlags.CHECKED_SUCCESS)
	}
	
//	 def dispatch computeTypes(UIElement literal, ITypeComputationState state) {
//        state.withNonVoidExpectation.computeTypes(literal.obj)
//        state.acceptActualType(getPrimitiveVoid(state))
//    }

}
