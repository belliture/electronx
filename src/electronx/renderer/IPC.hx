package electronx.renderer;

import haxe.extern.Rest;
import js.Lib;
import js.node.events.EventEmitter;

extern class IPC extends EventEmitter<IPC> {
    @:extern public static inline function require():IPC return Lib.require("ipc");

    public function send(channel:String, args:Rest<Dynamic>):Void;

    public function sendSync(channel:String, args:Rest<Dynamic>):Dynamic;

    public function sendToHost(channel:String, args:Rest<Dynamic>):Void;
}
