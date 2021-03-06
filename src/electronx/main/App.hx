package electronx.main;

import electronx.events.ElectronEvent;
import electronx.main.BrowserWindow;
import electronx.main.Menu;
import haxe.Constraints.Function;
import js.Lib;
import js.node.events.EventEmitter;

@:enum abstract AppEvent<T:Function>(Event<T>) to Event<T> {
    var WillFinishLaunching:AppEvent<Void -> Void> = "will-finish-launching";
    var Ready:AppEvent<Void -> Void> = "ready";
    var WindowAllClosed:AppEvent<Void -> Void> = "window-all-closed";
    var BeforeQuit:AppEvent<Dynamic -> Void> = "before-quit";
    var WillQuit:AppEvent<ElectronEvent -> Void> = "will-quit";
    var Quit:AppEvent<Void -> Void> = "quit";
    var OpenFile:AppEvent<ElectronEvent -> String -> Void> = "open-file";
    var OpenUrl:AppEvent<ElectronEvent -> String -> Void> = "open-url";
    var ActivateWithNoOpenWindows:AppEvent<Void -> Void> = "activate-with-no-open-windows";
    var BrowserWindowBlur:AppEvent<ElectronEvent -> BrowserWindow -> Void> = "browser-window-blur";
    var BrowserWindowFocus:AppEvent<ElectronEvent -> BrowserWindow -> Void> = "browser-window-focus";
}

@:enum abstract SpecialDirectory(String) to String {
    var Home = "home";
    var AppData = "appData";
    var UserData = "userData";
    var Cache = "cache";
    var UserCache = "userCache";
    var Temp = "temp";
    var UserDesktop = "userDesktop";
    var Exe = "exe";
    var Module = "module";
}

@:enum abstract BounceType(String) to String {
    var Critical = "critical";
    var Informational = "informational";
}

abstract BounceRequestId(Int) from Int to Int {
    inline public function new(id:Int) this = id;
}

extern class App extends EventEmitter<App> {
    @:extern public static inline function require():App return Lib.require("app");

    public function quit():Void;

    public function getPath(name:String):String;

    public function setPath(name:String, path:String):Void;

    public function getVersion():String;

    public function getName():String;

    public function resolveProxy(url:String, callback:Function):String;

    public function addRecentDocument(path:String):Void;

    public function clearRecentDocuments():Void;

    public function setUserTasks(tasks:Array<Task>):Void;

    public var commandLine(default,null):CommandLine;

    public var dock(default,null):Null<Dock>;
}

extern class CommandLine {
    public function appendSwitch(switch_:String, ?value:String):Void;

    public function appendArgument(value:String):Void;
}

extern class Dock {
    public function bounce(?type:BounceType):BounceRequestId;

    public function cancelBounce(id:BounceRequestId):Void;

    public function setBadge(text:String):Void;

    public function getBadge():String;

    public function hide():Void;

    public function show():Void;

    public function setMenu(menu:Menu):Void;
}

typedef Task = {
    program: String,
    arguments: String,
    title: String,
    description: String,
    iconPath: String,
    iconIndex: Int
}
