package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.XAbstractFeatureCall
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.XMemberFeatureCall
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.xtext.example.mydsl.myDsl.Action
import org.xtext.example.mydsl.myDsl.TestBody
import org.xtext.example.mydsl.myDsl.UIElement
import org.xtext.example.mydsl.myDsl.InitBody
import org.xtext.example.mydsl.myDsl.EventHandler
import org.xtext.example.mydsl.myDsl.Arguments
import org.eclipse.xtext.xbase.compiler.ImportManager
import org.xtext.example.mydsl.services.MyDslGrammarAccess.DatumElements
import org.eclipse.xtext.xbase.XFeatureCall
import org.eclipse.xtext.common.types.JvmTypeReference
import org.eclipse.xtext.xbase.XbasePackage

class MyDslCompiler extends XbaseCompiler {

//JvmTypeReference
	override protected doInternalToJavaStatement(XExpression expr, ITreeAppendable tree, boolean isReferenced) {
		switch expr {
			InitBody: {
				tree.newLine
				for (action : expr.actions)
					action.doInternalToJavaStatement(tree, isReferenced);
			}
			TestBody: {
				tree.newLine
				for (action : expr.actions)
					action.doInternalToJavaStatement(tree, isReferenced);
			}
			Action: {
				val action = expr as Action;
				tree.trace(action)
				tree.append("(new ");
				tree.append(action.type.qualifiedName + "(");
				for (target : action.args.targets) {
//					target..internalToConvertedExpression(tree);
//					this.internalToConvertedExpression(target.block, tree)
					target.block.internalToJavaStatement(tree, false);
				}
				tree.append(")).exec();").newLine
			}
			default: {
				super.doInternalToJavaStatement(expr, tree, isReferenced)
			}
		}
	}

//	override protected internalToConvertedExpression(XExpression expr, ITreeAppendable tree) {
//		switch expr {
//			UIElement: {
////				expr.internalToJavaStatement(tree, false);
////				b.trace(call, XbasePackage.Literals.XABSTRACT_FEATURE_CALL__FEATURE, 0).append(referenceName);
//				tree.trace(expr, XbasePackage.Literals.XABSTRACT_FEATURE_CALL__FEATURE, 0).append("reference");
//			}
//			default: {
//				super.internalToConvertedExpression(expr, tree)
//			}
//		}
//	}
	override dispatch void toJavaStatement(XAbstractFeatureCall expr, ITreeAppendable b, boolean isReferenced) {
		println("XAbstractFeatureCall: " + expr)
		if (expr instanceof XMemberFeatureCall) {
			featureCalltoJavaExpression(expr as XMemberFeatureCall, b, true);
		} else {
			toJavaStatement(expr, b, isReferenced);
		}
	}
//
//	def dispatch toJavaStatement(InitBody expr, ITreeAppendable tree, boolean isReferenced) {
////		for (eventHandler : expr.handlers)
////			eventHandler.toJavaStatement(tree, false);
//		for (action : expr.actions) {
//			action.doInternalToJavaStatement(tree, false);
//		}
//	}
//
//	def dispatch toJavaStatement(TestBody expr, ITreeAppendable tree, boolean isReferenced) {
//		for (action : expr.actions)
//			action.doInternalToJavaStatement(tree, isReferenced);
//	}
//	def dispatch toJavaStatement(Action action, ITreeAppendable tree, boolean isReferenced) {
//		tree.trace(action)
//		tree.append("(new ");
//		tree.append(action.type.qualifiedName + "(");
//		for (target : action.args.targets) {
//			target.internalToConvertedExpression(tree);
//		}
////		for (d : action.args.data) {
////			d.doInternalToJavaStatement( tree , false)
////		}
//		tree.append(")).exec();").newLine
//	}
//	def compile(ITreeAppendable tree, Action action, boolean isReferenced) {
//		tree.append('''(new helloooo ��FOR arg : action.args.targets�� ��arg.toJavaExpression(tree)�� ��ENDFOR��''')
//	}
//
//	def compile(UIElement element) '''kkk'''
}
