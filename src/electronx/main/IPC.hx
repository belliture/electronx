package electronx.main;

import js.Lib;
import js.node.events.EventEmitter;

extern class IPC extends EventEmitter<IPC> {
    @:extern public static inline function require():IPC return Lib.require("ipc");
}
