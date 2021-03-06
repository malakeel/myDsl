/*
 * generated by Xtext 2.10.0
 */
package org.xtext.example.mydsl.ui.contentassist

import org.xtext.example.mydsl.ui.contentassist.AbstractMyDslProposalProvider
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.Assignment
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor.Delegate
import org.eclipse.jface.text.contentassist.ICompletionProposal
import org.eclipse.xtext.ui.editor.contentassist.ConfigurableCompletionProposal
import org.eclipse.xtext.RuleCall
import org.eclipse.xtext.EcoreUtil2
import com.google.inject.Inject
import org.eclipse.xtext.common.types.access.IJvmTypeProvider
import org.eclipse.xtext.common.types.xtext.ui.ITypesProposalProvider

/**
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#content-assist
 * on how to customize the content assistant.
 */
class MyDslProposalProvider extends AbstractMyDslProposalProvider {

	@Inject
	private IJvmTypeProvider.Factory jvmTypeProviderFactory;
	@Inject
	private ITypesProposalProvider typeProposalProvider;

//	override complete_ActionType(EObject model, RuleCall call, ContentAssistContext context,
//		ICompletionProposalAcceptor acceptor) {
////		super.completeUsage_Definition(model, assignment, context, new StringProposalDelegate(acceptor, context))
////		if (EcoreUtil2.getContainerOfType(model, null) != null) {
////			final
////			IJvmTypeProvider
////		def	jvmTypeProvider = jvmTypeProviderFactory.createTypeProvider(model.eResource().getResourceSet());
////			// Graphiti specific
////			final
////			JvmType
////			interfaceToImplement = jvmTypeProvider.findTypeByName(ICustomFeature.class.getName());
////			typeProposalProvider.createSubTypeProposals(interfaceToImplement, this, context,
////				SprayPackage.Literals.BEHAVIOR__REALIZED_BY, TypeMatchFilters.canInstantiate(), acceptor);
////		} else {
////			super.completeJvmParameterizedTypeReference_Type(model, assignment, context, acceptor);
////		}
//
////		super.complete_ActionType(model, call, context, acceptor);
//	}

	static class StringProposalDelegate extends Delegate {

		ContentAssistContext ctx

		new(ICompletionProposalAcceptor delegate, ContentAssistContext ctx) {
			super

	(delegate)this.ctx = ctx
}

		override accept(ICompletionProposal proposal) {
			if (proposal instanceof ConfigurableCompletionProposal) {
				val endPos = proposal.replacementOffset + proposal.replacementLength
				if (ctx.document != null && ctx.document.length > endPos) {
					// We are not at the end of the file
					if ("\"" == ctx.document.get(endPos, 1)) {
						proposal.replacementLength = proposal.replacementLength - 1
						proposal.replacementString = proposal.replacementString.substring(0,
							proposal.replacementString.length - 1)
					}
				}
			}
			super.accept(proposal)
		}

	}
}
