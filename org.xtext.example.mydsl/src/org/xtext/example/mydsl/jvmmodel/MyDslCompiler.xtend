package org.xtext.example.mydsl.jvmmodel

import org.eclipse.xtext.xbase.XAbstractFeatureCall
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.XMemberFeatureCall
import org.eclipse.xtext.xbase.XStringLiteral
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.xtext.example.mydsl.myDsl.Action
import org.xtext.example.mydsl.myDsl.InitBody
import org.xtext.example.mydsl.myDsl.PropRef
import org.xtext.example.mydsl.myDsl.TestBody

class MyDslCompiler extends XbaseCompiler {

	override protected doInternalToJavaStatement(XExpression expr, ITreeAppendable tree, boolean isReferenced) {
		switch expr {
			InitBody: {
				tree.newLine
				for (action : expr.expressions)
					action.doInternalToJavaStatement(tree, isReferenced);
			}
			TestBody: {
				tree.newLine
				for (action : expr.expressions)
					action.doInternalToJavaStatement(tree, isReferenced);
			}
			Action: {
				val action = expr as Action;
				tree.trace(action)
				tree.append("(new ");
				tree.append(action.type.qualifiedName + "(");

				var itr = action.args.targets.iterator
				while (itr.hasNext) {
					itr.next.internalToConvertedExpression(tree)
					if (itr.hasNext)
						tree.append(",")
				}

				if (action.args.targets.size > 0 && action.args.data.size > 0) {
					tree.append(",")
				}

				val dataItr = action.args.data.iterator

				while (dataItr.hasNext) {
					dataItr.next.internalToConvertedExpression(tree)
					if (dataItr.hasNext)
						tree.append(",")
				}

				tree.append(")).exec();").newLine
			}
			default: {
				super.doInternalToJavaStatement(expr, tree, isReferenced)
			}
		}
	}

	override protected internalToConvertedExpression(XExpression expr, ITreeAppendable tree) {
		switch expr {
			PropRef: {
				expr.compile(tree)
			}
			XStringLiteral: {
				// FIXME why do we need this instead of just super.internalToConvertedExpression(expr, tree)
				tree.append('"' + expr.value + '"')
			}
			default: {
				super.internalToConvertedExpression(expr, tree)
			}
		}
	}

	def void compile(PropRef ref, ITreeAppendable tree) {
		tree.append("ctx.get(\"");
		tree.append(ref.ns);
		tree.append(":" + ref.prop + "\")");
	}

	override dispatch void toJavaStatement(XAbstractFeatureCall expr, ITreeAppendable b, boolean isReferenced) {
		if (expr instanceof XMemberFeatureCall) {
			featureCalltoJavaExpression(expr as XMemberFeatureCall, b, true);
		} else {
			toJavaStatement(expr, b, isReferenced);
		}
	}

}
