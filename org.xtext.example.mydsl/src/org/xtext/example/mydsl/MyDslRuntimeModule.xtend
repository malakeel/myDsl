package org.xtext.example.mydsl

import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputer
import org.xtext.example.mydsl.jvmmodel.MyDslTypeComputer
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.xtext.example.mydsl.jvmmodel.MyDslCompiler

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
//    def Class<? extends ITypeComputer> bindITypeComputer() {
//        return MyDslTypeComputer
//    }
//    def Class<? extends XbaseCompiler> bindXbaseCompiler() {
//        return MyDslCompiler
//    }
}
