package org.xtext.example.mydsl

import com.google.inject.Binder
import org.eclipse.xtext.generator.IGenerator
import org.xtext.example.mydsl.jvmmodel.MyGenerator

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
class MyDslRuntimeModule extends AbstractMyDslRuntimeModule {

//	override bindIGenerator() {
////		super.bindIGenerator
//		MyGenerator
//	}

}
