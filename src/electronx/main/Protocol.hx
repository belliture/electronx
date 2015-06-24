package electronx.main;

import js.node.Buffer;

@:jsRequire("protocol")
extern class Protocol {
    public static function registerProtocol(scheme:String, handler:ProtocolHandler):Void;

    public static function unregisterProtocol(scheme:String):Void;

    public static function registerStandardSchemes(value:Array<String>):Void;

    public static function isHandledProtocol(scheme:String):Bool;

    public static function interceptProtocol(scheme:String, handler:ProtocolHandler):Void;

    public static function uninterceptProtocol(scheme:String):Void;
}

typedef ProtocolHandler = UrlRequest -> RequestJob

extern class RequestJob {}

@:native("require('protocol').RequestFileJob")
extern class RequestFileJob extends RequestJob {
    public function new(path:String);
}

@:native("require('protocol').RequestStringJob")
extern class RequestStringJob extends RequestJob {
    public function new(options:StringJobOption);
}

@:native("require('protocol').RequestBufferJob")
extern class RequestBufferJob extends RequestJob {
    public function new(options:BufferJobOption);
}

@:native("require('protocol').RequestHttpJob")
extern class RequestHttpJob extends RequestJob {
    public function new(options:HttpJobOption);
}

@:native("require('protocol').RequestErrorJob")
extern class RequestErrorJob extends RequestJob {
    public function new(code:Int);
}

typedef UrlRequest = {
    method: String,
    url: String,
    referrer: String
}

typedef StringJobOption = {
    ?mimeType: String,
    ?charset: String,
    data: String
}

typedef BufferJobOption = {
    ?mimeType: String,
    ?encoding: String,
    data: Buffer
}

typedef HttpJobOption = {
    url: String,
    ?method: String,
    referrer: String
}
