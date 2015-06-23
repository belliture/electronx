package electronx.main;

import js.node.events.EventEmitter;

@:jsRequire("ipc")
extern class IPC extends EventEmitter<IPC> {}
