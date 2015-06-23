package electronx;

import haxe.extern.Rest;
import electronx.events.ElectronEvent;
import haxe.Constraints.Function;
import js.node.Buffer;
import js.node.events.EventEmitter;

@:enum abstract WebContentsEvent<T:Function>(Event<T>) to Event<T> {
    var DidFinishLoad:WebContentsEvent<Void -> Void> = "did-finish-load";
    var DidFailLoad:WebContentsEvent<ElectronEvent -> Int -> String -> Void> = "did-fail-load";
    var DidFrameFinishLoad:WebContentsEvent<ElectronEvent -> Bool -> Void> = "did-frame-finish-load";
    var DidStartLoading:WebContentsEvent<Void -> Void> = "did-start-loading";
    var DidStopLoading:WebContentsEvent<Void -> Void> = "did-stop-loading";
    var DidGetResponseDetails:WebContentsEvent<ElectronEvent -> Bool -> String -> String -> Int -> String -> String -> Dynamic -> Void> = "did-get-response-details";
    var DidGetRedirectRequest:WebContentsEvent<ElectronEvent -> String -> String -> Bool -> Void> = "did-get-redirect-request";
    var DomReady:WebContentsEvent<ElectronEvent -> Void> = "dom-ready";
    var PageFaviconUpdated:WebContentsEvent<ElectronEvent -> Array<String> -> Void> = "page-favicon-updated";
    var NewWindow:WebContentsEvent<ElectronEvent -> String -> String -> String -> Void> = "new-window";
    var WillNavigate:WebContentsEvent<ElectronEvent -> String -> Void> = "will-navigate";
    var Crashed:WebContentsEvent<Void -> Void> = "crashed";
    var GpuCrashed:WebContentsEvent<Void -> Void> = "gpu-crashed";
    var PluginCrashed:WebContentsEvent<ElectronEvent -> String -> String -> Void> = "plugin-crashed";
    var Destroyed:WebContentsEvent<Void -> Void> = "destroyed";
}

extern class WebContents {
    public function loadUrl(url:String, ?options:{ httpReferrer:String, userAgent:String }):Void;

    public function getUrl():String;

    public function getTitle():String;

    public function isLoading():Bool;

    public function isWaitingForResponse():Bool;

    public function stop():Void;

    public function reload():Void;

    public function reloadIgnoringCache():Void;

    public function canGoBack():Bool;

    public function canGoForward():Bool;

    public function canGoToOffset(offset:Int):Bool;

    public function clearHistory():Void;

    public function goBack():Void;

    public function goForward():Void;

    public function goToIndex(index:Int):Void;

    public function goToOffset(offset:Int):Void;

    public function isCrashed():Bool;

    public function setUserAgent(userAgent:String):Void;

    public function insertCSS(css:String):Void;

    public function executeJavaScript(code:String):Void;

    public function setAudioMuted(muted:Bool):Void;

    public function undo():Void;

    public function redo():Void;

    public function cut():Void;

    public function copy():Void;

    public function paste():Void;

    public function pasteAndMatchStyle():Void;

    public function delete():Void;

    public function selectAll():Void;

    public function unselect():Void;

    public function replace(text:String):Void;

    public function replaceMisspelling(text:String):Void;

    public function hasServiceWorker(callback:Bool -> Void):Void;

    public function unregisterServiceWorker(callback:Bool -> Void):Void;

    public function print(?options:{ silent:Bool, printBackground:Bool }):Void;

    public function printToPDF(options:{ marginsType:Int, printBackground:Bool, printSelectionOnly:Bool, landscape:Bool }, callback:Dynamic -> Buffer -> Void):Void;

    public function send(channel:String, args:Rest<Dynamic>):Bool;
}

extern class Session {
    public var cookies(default,null):Cookies;
}

extern class Cookies {
    public function get(details:GetCookie, callback:Dynamic -> Cookie -> Void):Void;

    public function set(details:SetCookie, callback:Dynamic -> Void):Void;
    
    public function remove(details:{ url:String, name:String }, callback:Dynamic -> Void):Void;
}

typedef GetCookie = {
    url: String,
    name: String,
    domain: String,
    path: String,
    secure: Bool,
    session: Bool
}

typedef Cookie = {
    name: String,
    value: String,
    domain: String,
    host_only: String,
    path: String,
    secure: Bool,
    http_only: Bool,
    session: Bool,
    ?expirationDate: Float,
}

typedef SetCookie = {
    url: String,
    name: String,
    value: String,
    domain: String,
    path: String,
    secure: Bool,
    session: Bool,
    expirationDate: Float
}
