package electronx;

import haxe.Constraints.Function;

@:jsRequire("content-tracing")
extern class ContentTracing {
    @:native("DEFAULT_OPTIONS") public static var default_options(default,null):Int;

    @:native("ENABLE_SYSTRACE") public static var enable_systrace(default,null):Int;

    @:native("ENABLE_SAMPLING") public static var enable_sampling(default,null):Int;

    @:native("RECORD_CONTINUOUSLY") public static var record_continuously(default,null):Int;

    public static function getCategories(callback:Function):Bool;

    public static function startRecording(categoryFilter:String, options:Int, callback:Function):Bool;

    public static function stopRecording(resultFilePath:String, callback:Function):Bool;

    public static function startMonitoring(categoryFilter:String, options:Int, callback:Function):Bool;

    public static function stopMonitoring(callback:Function):Bool;

    public static function captureMonitoringSnapshot(resultFilePath:String, callback:Function):Bool;

    public static function getTraceBufferUsage(callback:Function):Bool;

    public static function setWatchEvent(categoryName:String, eventName:String, callback:Function):Bool;

    public static function cancelWatchEvent():Bool;
}
