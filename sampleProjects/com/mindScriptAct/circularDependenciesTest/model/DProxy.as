package com.mindScriptAct.circularDependenciesTest.model {
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class DProxy extends Proxy{
	
	
	
	[Inject]
	public var deadProxy:DeadProxy;
	
	
	public function DProxy(){
		
	}
	
	override protected function onRegister():void{
	
	}
	
	override protected function onRemove():void{
	
	}

}
}