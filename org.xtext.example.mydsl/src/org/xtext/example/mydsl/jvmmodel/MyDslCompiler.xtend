package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.eclipse.xtext.xbase.XExpression
import org.xtext.example.mydsl.myDsl.UIElement
import org.xtext.example.mydsl.myDsl.Action
import org.xtext.example.mydsl.services.MyDslGrammarAccess.TestBlockElements
import org.eclipse.xtext.xbase.impl.XBlockExpressionImplCustom
import org.xtext.example.mydsl.myDsl.TestDefinition
import org.xtext.example.mydsl.myDsl.TestBlock
import org.eclipse.xtext.xbase.XFeatureCall
import org.eclipse.xtext.xbase.XAbstractFeatureCall
import org.eclipse.xtext.common.types.JvmConstructor
import org.eclipse.xtext.xbase.XMemberFeatureCall

class MyDslCompiler extends XbaseCompiler {

	override protected doInternalToJavaStatement(XExpression expr, ITreeAppendable appendable, boolean isReferenced) {

		switch expr {
			TestBlock: {
				for (action : expr.expressions)
					action.doInternalToJavaStatement(appendable, isReferenced);
			}
			Action: {
				appendable.newLine
				val action = expr as Action;
				appendable.trace(action)
				appendable.append("(new ");
				appendable.append(action.type.qualifiedName + "(");
				for (target : action.config.targets)
					this.doInternalToJavaStatement(target.block, appendable, isReferenced)
				appendable.append(")).exec();").newLine
			}
			UIElement: {
				expr.internalToJavaStatement(appendable, false);
			}
			default: {
				super.doInternalToJavaStatement(expr, appendable, isReferenced)
			}
		}
	}

	public override dispatch void toJavaStatement(XAbstractFeatureCall expr, ITreeAppendable b, boolean isReferenced) {
		if (expr instanceof XMemberFeatureCall) {
			featureCalltoJavaExpression(expr, b, false);
		} else {
			toJavaStatement(expr as XAbstractFeatureCall, b, isReferenced);
		}
	}
}
