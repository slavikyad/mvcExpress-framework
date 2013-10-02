// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.extensions.combo.scopedLive.mvc {
import flash.utils.Dictionary;

import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.extensions.live.core.ProcessMapLive;
import mvcexpress.extensions.live.modules.ModuleLive;
import mvcexpress.extensions.scoped.mvc.ProxyScoped;
import mvcexpress.mvc.Proxy;

use namespace pureLegsCore;

/**
 * Proxy holds and manages application data, provide API to work with it.                </br>
 * Can send constants. (Usually sends one with each data update)                            </br>
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 *
 * @version live.1.0.beta2
 */

use namespace pureLegsCore;

public class ProxyScopedLive extends ProxyScoped {

	/** Used to provide stuff for processes. */
	private var processMap:ProcessMapLive;

	/**    all objects provided by this proxy stored by name */
	private var provideRegistry:Dictionary = new Dictionary(); //* of Object by String*/


	//----------------------------------
	//     mvcExpressLive functions
	//----------------------------------

	/**
	 * Provides any complex object under given name. Provided object can be Injected into Tasks.            <br>
	 * Providing primitive data typse will throw error in debug mode.
	 * @param    object    any complex object
	 * @param    name    name for complex object. (bust be unique, or error will be thrown.)
	 */
	protected function provide(object:Object, name:String):void {
		use namespace pureLegsCore;

		processMap.provide(object, name);
		provideRegistry[name] = object;
	}

	/**
	 * Remove pasibility for provided object with given name to be Injected into Tasks.            <br>
	 * If object never been provided with this name - action will fail silently
	 * @param    name    name for provided object.
	 */
	protected function unprovide(name:String):void {
		use namespace pureLegsCore;

		processMap.unprovide(name);
		delete provideRegistry[name];
	}

	/**
	 * Remove all from this proxy provided object.
	 */
	protected function unprovideAll():void {
		for (var name:String in provideRegistry) {
			unprovide(name);
		}
	}

	/**
	 * sets processMap interface.
	 * @param    iProcessMap
	 * @private
	 */
	pureLegsCore function setProcessMap($processMap:ProcessMapLive):void {
		processMap = $processMap;
	}

	/**
	 * marks mediator as not ready and calls onRemove().
	 * called from proxyMap
	 * @private
	 */
	override pureLegsCore function remove():void {
		use namespace pureLegsCore;

		unprovideAll();
		provideRegistry = null;

		super.remove();
	}

	//----------------------------------
	//    Extension checking: INTERNAL, DEBUG ONLY.
	//----------------------------------

	CONFIG::debug
	static public var extension_id:int = ModuleLive.EXTENSION_LIVE_ID;

	CONFIG::debug
	static public var extension_name:String = ModuleLive.EXTENSION_LIVE_NAME
}
}