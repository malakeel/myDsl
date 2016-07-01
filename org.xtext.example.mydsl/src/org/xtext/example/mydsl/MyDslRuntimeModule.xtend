package org.xtext.example.mydsl

import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputer
import org.xtext.example.mydsl.jvmmodel.MyDslTypeComputer
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.xtext.example.mydsl.jvmmodel.MyDslCompiler
import org.eclipse.xtext.xbase.util.XExpressionHelper
import org.xtext.example.mydsl.jvmmodel.MyDslXExpressionHelper
import org.eclipse.xtext.xbase.scoping.batch.ImplicitlyImportedFeatures
import org.eclipse.xtext.xbase.typesystem.references.ITypeReferenceOwner

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
class MyDslRuntimeModule extends AbstractMyDslRuntimeModule {
//	override bindIGenerator() {
////		super.bindIGenerator
//		MyGenerator
//	}
//
//
//def Class<? extends ITypeReferenceOwner> bindITypeReferenceOwner(){
//	
//}
	def Class<? extends ITypeComputer> bindITypeComputer() {
		return MyDslTypeComputer
	}

	def Class<? extends XbaseCompiler> bindXbaseCompiler() {
		return MyDslCompiler
	}

	def Class<? extends XExpressionHelper> bindXExpressionHelper() {
		return MyDslXExpressionHelper
	}

//	def Class<? extends ImplicitlyImportedFeatures> bindImplicitlyImportedTypes() {
//		return TortoiseShellImplicitlyImportedFeatures
//	}
//
//	def Class<? extends ITortoiseInterpreter> bindITortoiseInterpreter() {
//		return TortoiseShellInterpeter
//	}
//
//	override Class<? extends IdentifiableSimpleNameProvider> bindIdentifiableSimpleNameProvider() {
//		return TortoiseShellIdentifiableSimpleNameProvider
//	}
//
//	override Class<? extends IGenerator> bindIGenerator() {
//		return NullGenerator
//	}
//
//	override Class<? extends IDefaultResourceDescriptionStrategy> bindIDefaultResourceDescriptionStrategy() {
//		return TortoiseResourceDescriptionStrategy
//	}
}
