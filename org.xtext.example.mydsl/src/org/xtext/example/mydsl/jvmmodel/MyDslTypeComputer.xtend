package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputationState
import org.eclipse.xtext.xbase.typesystem.computation.XbaseTypeComputer
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceFlags
import org.xtext.example.mydsl.myDsl.Action
import org.eclipse.xtext.xbase.XExpression

class MyDslTypeComputer extends XbaseTypeComputer {

	override computeTypes(XExpression expression, ITypeComputationState state) {
		if (expression instanceof Action) {
			_computeTypes(expression as Action, state);
		} else {
			super.computeTypes(expression, state)
		}
	}

	protected def void _computeTypes(Action action, ITypeComputationState state) {
		for (t : action.args.targets) {
			println("TODO better logic here ?!?")

			val iaction = state.getReferenceOwner().getServices().getTypeReferences().findDeclaredType(
				"org.example.ILocator", state.referenceOwner.contextResourceSet)
			state.withExpectation(
				state.referenceOwner.newParameterizedTypeReference(iaction)
			).computeTypes(t)
		}
		state.acceptActualType(getTypeForName(Void.TYPE, state), ConformanceFlags.CHECKED_SUCCESS)

	}

}
