package org.xtext.example.mydsl.jvmmodel

import com.google.inject.Inject
import org.eclipse.xtext.xbase.jvmmodel.AbstractModelInferrer
import org.eclipse.xtext.xbase.jvmmodel.IJvmDeclaredTypeAcceptor
import org.eclipse.xtext.xbase.jvmmodel.JvmTypesBuilder
import org.xtext.example.mydsl.myDsl.Domainmodel
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.xbase.compiler.TypeReferenceSerializer
import org.eclipse.xtext.xbase.compiler.StringBuilderBasedAppendable
import org.eclipse.xtext.common.types.JvmTypeReference
import org.eclipse.xtext.xbase.compiler.ImportManager
import org.xtext.example.mydsl.myDsl.Action
import org.eclipse.xtext.xbase.compiler.JvmModelGenerator

class MyGenerator extends JvmModelGenerator {
//implements IGenerator {
	@Inject extension IQualifiedNameProvider

	@Inject extension TypeReferenceSerializer

//	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
//		for (e : resource.allContents.toIterable.filter(typeof(Action))) {
//			fsa.generateFile(e.fullyQualifiedName.toString("/") + ".java", e.compile)
//		}
//	}
//
//	def compile(Action it) '''
//		«val importManager = new ImportManager(true)»
//		«val body =  body(importManager)»
//		«IF eContainer != null»
//			package «eContainer.fullyQualifiedName»;
//		«ENDIF»
//		
//		«FOR i : importManager.imports»
//			import «i»;
//		«ENDFOR»
//		«body»
//	'''
//
//	def body(Action it, ImportManager importManager) '''
//		public class «name» «IF superType != null»
//		  extends «superType.shortName(importManager)» «ENDIF»{
//		  «FOR f : features»
//		    «f.compile(importManager)»
//		  «ENDFOR»
//		}
//	'''
//	
//	def compile(Feature it, ImportManager importManager) '''
//		private «type.shortName(importManager)» «name»;
//		
//		public «type.shortName(importManager)» 
//		  get«name.toFirstUpper»() {
//		  return «name»;
//		}
//		
//		public void set«name.toFirstUpper»(
//		  «type.shortName(importManager)» «name») {
//		  this.«name» = «name»;
//		}
//	'''
//	
//	def shortName(JvmTypeReference ref, ImportManager importManager) {
//		val result = new StringBuilderBasedAppendable(importManager)
//		ref.serialize(ref.eContainer, result);
//		result.toString
//	}
}
