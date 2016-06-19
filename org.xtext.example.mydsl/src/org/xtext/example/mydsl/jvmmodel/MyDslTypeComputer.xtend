package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.typesystem.computation.XbaseTypeComputer
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputationState
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceFlags
import org.xtext.example.mydsl.myDsl.UIElement


class MyDslTypeComputer extends XbaseTypeComputer {

	override computeTypes(XExpression expression, ITypeComputationState state) {
		if (expression instanceof UIElement) {
			_computeTypes(expression as UIElement, state);
		} else {
			super.computeTypes(expression, state)
		}
		
	}

	protected def void _computeTypes(UIElement object, ITypeComputationState state) {
		state.withExpectation(getPrimitiveVoid(state)).computeTypes(object.block)
		state.acceptActualType(getTypeForName(Runnable, state), ConformanceFlags.CHECKED_SUCCESS)
	}

}
