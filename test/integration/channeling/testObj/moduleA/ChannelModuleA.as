package integration.channeling.testObj.moduleA {
import flash.display.Sprite;
import flash.events.Event;
import org.mvcexpress.modules.ModuleCore;

/**
 * COMMENT : todo
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ChannelModuleA extends ModuleCore {
	public var view:ChannelViewA;
	
	static public const NAME:String = "ChannelModuleA";
	
	public function ChannelModuleA() {
		super(ChannelModuleA.NAME);
	}
	
	public function cheateTestMediator():void {
		mediatorMap.map(ChannelViewA, ChannelAMediator);
		view = new ChannelViewA();
		mediatorMap.mediate(view);
	}
	
	public function addChannelHandler_test1():void {
		view.dispatchEvent(new Event("addChannelHandler_test1"));
	}
	
	public function removeChannelHandler_test1():void {
		view.dispatchEvent(new Event("removeChannelHandler_test1"));
	}
	
	public function addChannelHandler_test2():void {
		view.dispatchEvent(new Event("addChannelHandler_test2"));
	}
	
	public function addChannelHandler_testChannel_test3():void {
		view.dispatchEvent(new Event("addChannelHandler_testChannel_test3"));
	}
	
	override protected function onInit():void {
	
	}
	
	override protected function onDispose():void {
	
	}
}
}