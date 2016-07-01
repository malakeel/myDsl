package org.xtext.example.mydsl.jvmmodel;

import java.util.List;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.xbase.XExpression;
import org.eclipse.xtext.xbase.jvmmodel.IJvmModelAssociator;
import org.eclipse.xtext.xbase.jvmmodel.JvmTypesBuilder;
import org.eclipse.xtext.common.types.JvmExecutable;
import org.eclipse.xtend2.lib.StringConcatenationClient;
import org.eclipse.xtext.common.types.JvmMember;
import org.eclipse.xtext.xbase.compiler.CompilationStrategyAdapter;
import org.eclipse.xtext.xbase.compiler.CompilationTemplateAdapter;

import com.google.inject.Inject;

public class MyJvmTypesBuilder extends JvmTypesBuilder {

	@Inject
	private IJvmModelAssociator associator;
	
//	private 
//	public EList<XExpression> getStatements(JvmExecutable logicalContainer) {
//		EList<EObject> contents = logicalContainer.eContents();
//		for (EObject o : contents) {
//			System.out.println(o.toString());
//		}
////		associator.
//		return null;
//	}
	
	public void setStatment(/* @Nullable */ JvmExecutable logicalContainer, /* @Nullable */ XExpression expr) {
		if (logicalContainer == null || expr == null)
			return;
//		removeExistingBody(logicalContainer);
//		associator.
		associator.associateLogicalContainer(expr, logicalContainer);
	}
	
	 
//	
//	public void append(JvmExecutable logicalContainer , XExpression expression) {
//		EList<Adapter> contents = logicalContainer.eAdapters();
//		for (Adapter o : contents) {
//			
//			System.out.println(o.toString());
//		}
//	}

//	private XExpression getMethodBody() {
//
//		return null;
//	}

//	public void removeExistingBody(JvmMember member) {
//		if (member != null) {
//			Object[] adapters = member.eAdapters().toArray();
//			for (int i = 0, j = 0; i < adapters.length; i++) {
//				if (adapters[i] instanceof CompilationStrategyAdapter || adapters[i] instanceof CompilationTemplateAdapter) {
//					member.eAdapters().remove(j);
//					// member.e
//				} else {
//					j++;
//				}
//			}
//			associator.removeLogicalChildAssociation(member);
//		}
//	}

//	public void setBody(/* @Nullable */JvmExecutable logicalContainer, /*
//																		 * @Nullable
//																		 */XExpression expr) {
//		if (logicalContainer == null || expr == null)
//			return;
//		removeExistingBody(logicalContainer);
//		associator.associateLogicalContainer(expr, logicalContainer);
//	}
}
