// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.core {
import flash.display.Sprite;
import org.mvcexpress.base.CommandMap;
import org.mvcexpress.base.MediatorMap;
import org.mvcexpress.base.ProxyMap;

/**
 * Core Module class as sprite.
 * <p>
 * It inits framework and lets you set up your application. (or execute Cammands that will do it.)
 * Also you can create modular application by having more then one module.
 * </p>
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ModuleSprite extends Sprite {
	
	private var moduleBase:ModuleBase;
	
	protected var proxyMap:ProxyMap;
	protected var mediatorMap:MediatorMap;
	protected var commandMap:CommandMap;
	
	/**
	 * CONSTRUCTOR
	 * @param	moduleName	module name that is used for referencing a module. (if not provided - unique name will be generated.)
	 * @param	autoInit	if set to false framework is not initialized for this module. If you want to use framework features you will have to manually init() it first.
	 * 						(or you start getting null reference errors.)
	 */
	public function ModuleSprite(moduleName:String = null, autoInit:Boolean = true) {
		moduleBase = ModuleBase.getModuleInstance(moduleName, autoInit);
		//
		proxyMap = moduleBase.proxyMap;
		mediatorMap = moduleBase.mediatorMap;
		commandMap = moduleBase.commandMap;
		//
		if (autoInit) {
			onInit();
		}
	}
	
	/**
	 * Name of the module
	 */
	public function get moduleName():String {
		return moduleBase.moduleName;
	}
	
	/**
	 * Initializes module. If this function is not called module will not work properly.
	 * By default it is called in constructor, but you can do it manually if you set constructor parameter 'autoInit' to false.
	 */
	protected function initModule():void {
		moduleBase.initModule();
		onInit();
	}
	
	/**
	 * Function called after framework is initialized.
	 * Meant to be overridden.
	 */
	protected function onInit():void {
		// for override
	}
	
	/**
	 * Function to get rid of module.
	 * - All module cammands are unmapped.
	 * - All module mediators are unmediated
	 * - All module proxies are unmapped
	 * - All internals are nulled.
	 */
	public function disposeModule():void {
		onDispose();
		moduleBase.disposeModule();
	}
	
	/**
	 * Function called before module is destroyed.
	 * Meant to be overridden.
	 */
	protected function onDispose():void {
		// for override
	}
	
	/**
	 * Message sender.
	 * @param	type	type of the message. (Commands and handle functions must bu map to it to react.)
	 * @param	params	Object that will be send to Command execute() or to handle function as parameter.
	 * @param	targetModuleNames	array of module names as strings, by default [MessageTarget.SELF] is used.<br>
	 * 									To target all existing modules use : [MessageTarget.ALL]
	 */
	protected function sendMessage(type:String, params:Object = null, targetModuleNames:Array = null):void {
		moduleBase.sendMessage(type, params, targetModuleNames);
	}
	
	//----------------------------------
	//     Debug
	//----------------------------------
	
	/**
	 * List all message mappings.
	 */
	public function listMappedMessages():String {
		return moduleBase.listMappedMessages();
	}
	
	/**
	 * List all view mappings.
	 */
	public function listMappedMediators():String {
		return moduleBase.listMappedMediators();
	}
	
	/**
	 * List all model mappings.
	 */
	public function listMappedProxies():String {
		return moduleBase.listMappedProxies();
	}
	
	/**
	 * List all controller mappings.
	 */
	public function listMappedCommands():String {
		return moduleBase.listMappedCommands();
	}

}
}