package electronx.renderer;

import electronx.main.BrowserWindow;
import electronx.main.WebContents;
import js.node.Process;

@:jsRequire("remote")
extern class Remote {
    public static function require(module:String):RemoteObject<Dynamic>;

    public static function getCurrentWindow():RemoteObject<BrowserWindow>;

    public static function getCurrentWebContent():RemoteObject<WebContents>;

    public static function getGlobal(name:String):RemoteObject<Dynamic>;

    public static var process(default,null):RemoteObject<Process>;
}

typedef RemoteObject<T> = T
