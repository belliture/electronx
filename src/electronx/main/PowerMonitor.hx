package electronx.main;

import haxe.Constraints.Function;
import js.Lib;
import js.node.events.EventEmitter;

@:enum abstract PowerMonitorEvent<T:Function>(Event<T>) to Event<T> {
    var Suspend:PowerMonitorEvent<Void -> Void> = "suspend";
    var Resume:PowerMonitorEvent<Void -> Void> = "resume";
    var OnAC:PowerMonitorEvent<Void -> Void> = "on-ac";
    var OnBattery:PowerMonitorEvent<Void -> Void> = "on-battery";
}

extern class PowerMonitor extends EventEmitter<PowerMonitor> {
    @:extern public static inline function require():PowerMonitor return Lib.require("power-monitor");
}
