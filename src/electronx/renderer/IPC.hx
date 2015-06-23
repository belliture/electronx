package electronx.renderer;

import haxe.extern.Rest;
import js.node.events.EventEmitter;

@:jsRequire("ipc")
extern class IPC extends EventEmitter<IPC> {
    public static function send(channel:String, args:Rest<Dynamic>):Void;

    public static function sendSync(channel:String, args:Rest<Dynamic>):Dynamic;

    public static function sendToHost(channel:String, args:Rest<Dynamic>):Void;
}
