package electronx;

import electronx.Menu;
import electronx.Rect;
import electronx.Size;
import electronx.WebContents;
import electronx.WH;
import electronx.XY;
import electronx.events.ElectronEvent;
import haxe.Constraints.Function;
import js.node.Buffer;
import js.node.events.EventEmitter;

@:enum abstract BrowserWindowEvent<T:Function>(Event<T>) to Event<T> {
    var PageTitleUpdated:BrowserWindowEvent<ElectronEvent -> Void> = "page-title-updated";
    var Close:BrowserWindowEvent<ElectronEvent -> Void> = "close";
    var Closed:BrowserWindowEvent<Void -> Void> = "closed";
    var Unresponsive:BrowserWindowEvent<Void -> Void> = "unresponsive";
    var Responsive:BrowserWindowEvent<Void -> Void> = "responsive";
    var Blur:BrowserWindowEvent<Void -> Void> = "blur";
    var Focus:BrowserWindowEvent<Void -> Void> = "focus";
    var Maximize:BrowserWindowEvent<Void -> Void> = "maximize";
    var Unmaximize:BrowserWindowEvent<Void -> Void> = "unmaximize";
    var Minimize:BrowserWindowEvent<Void -> Void> = "minimize";
    var Restore:BrowserWindowEvent<Void -> Void> = "restore";
    var Resize:BrowserWindowEvent<Void -> Void> = "resize";
    var Move:BrowserWindowEvent<Void -> Void> = "move";
    var Moved:BrowserWindowEvent<Void -> Void> = "moved";
    var EnterFullScreen:BrowserWindowEvent<Void -> Void> = "enter-full-screen";
    var LeaveFullScreen:BrowserWindowEvent<Void -> Void> = "leave-full-screen";
    var EnterHtmlFullScreen:BrowserWindowEvent<Void -> Void> = "enter-html-full-screen";
    var LeaveHtmlFullScreen:BrowserWindowEvent<Void -> Void> = "leave-html-full-screen";
    var DevtoolsOpened:BrowserWindowEvent<Void -> Void> = "devtools-opened";
    var DevtoolsClosed:BrowserWindowEvent<Void -> Void> = "devtools-closed";
    var DevtoolsFocused:BrowserWindowEvent<Void -> Void> = "devtools-focused";
}

abstract BrowserWindowId(Int) from Int to Int {
    inline public function new(id:Int) this = id;
}

@:jsRequire("browser-window")
extern class BrowserWindow extends EventEmitter<BrowserWindow> {
    public static function getAllWindows():Array<BrowserWindow>;

    public static function getFocusedWindow():BrowserWindow;

    public static function fromWebContents(webContents:WebContents):BrowserWindow;

    public static function fromId(id:BrowserWindowId):BrowserWindow;

    public static function addDevToolsExtension(path:String):String;

    public static function removeDevToolsExtension(name:String):Void;


    public var webContents(default,null):WebContents;

    public var devToolsWebContents(default,null):WebContents;

    public var id(default,null):BrowserWindowId;


    public function new(options:BrowserWindowOption);

    public function destroy():Void;

    public function close():Void;

    public function focus():Void;

    public function isFocused():Bool;

    public function show():Void;

    public function showInactive():Void;

    public function hide():Void;

    public function isVisible():Bool;

    public function maximize():Void;

    public function unmaximize():Void;

    public function isMaximized():Bool;

    public function minimize():Void;

    public function restore():Void;

    public function isMinimized():Bool;

    public function setFullScreen(flag:Bool):Void;

    public function isFullScreen():Bool;

    public function setBounds(rect:Rect):Void;

    public function getBounds():Rect;

    public function setSize(width:Int, height:Int):Void;

    public function getSize():WH;

    public function setContentSize(width:Int, height:Int):Void;

    public function getContentSize():WH;

    public function setMinimumSize(width:Int, height:Int):Void;

    public function getMinimumSize():WH;

    public function setResizable(resizable:Bool):Void;

    public function isResizable():Bool;

    public function setAlwaysOnTop(flag:Bool):Void;

    public function center():Void;

    public function setPosition(x:Int, y:Int):Void;

    public function getPosition():XY;

    public function setTitle(title:String):Void;

    public function getTitle():String;

    public function flashFrame(flag:Bool):Void;

    public function setSkipTaskbar(skip:Bool):Void;

    public function setKiosk(flag:Bool):Void;

    public function isKiosk():Bool;

    public function setRepresentedFilename(filename:String):Void;

    public function getRepresentedFilename():String;

    public function setDocumentEdited(edited:Bool):Void;

    public function isDocumentEdited():Bool;

    public function openDevTools(?options:{ detach:Bool }):Void;

    public function closeDevTools():Void;

    public function isDevToolsOpened():Bool;

    public function toggleDevTools():Void;

    public function inspectElement(x:Int, y:Int):Void;

    public function inspectServiceWorker():Void;

    public function focusOnWebView():Void;

    public function blurWebView():Void;

    @:overload(function(callback:NativeImage -> Void):Void {})
    public function capturePage(rect:Rect, callback:NativeImage -> Void):Void;

    public function print(?options:{ silent:Bool, printBackground:Bool }):Void;

    public function printToPDF(options:{ marginsType:Int, printBackground:Bool, printSelectionOnly:Bool, landscape:Bool }, callback:Dynamic -> Buffer -> Void):Void;

    public function loadUrl(url:String, ?options:{ httpReferrer:String, userAgent:String }):Void;

    public function reload():Void;

    public function setMenu(menu:Menu):Void;

    public function setProgressBar(progress:Float):Void;

    public function setOverlayIcon(overlay:NativeImage, description:String):Void;

    public function showDefinitionForSelection():Void;

    public function setAutoHideMenuBar(hide:Bool):Void;

    public function isMenuBarAutoHide():Bool;

    public function setMenuBarVisibility(visible:Bool):Void;

    public function isMenuBarVisible():Bool;

    public function setVisibleOnAllWorkspaces(visible:Bool):Void;

    public function isVisibleOnAllWorkspaces():Bool;
}

typedef BrowserWindowOption = {
    width: Int,
    height: Int
}
