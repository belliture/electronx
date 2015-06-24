package electronx.main;

@:jsRequire("global-shortcut")
extern class GlobalShortcut {
    public static function register(accelerator:String, callback:Void -> Void):Bool;

    public static function isRegistered(accelerator:String):Bool;

    public static function unregister(accelerator:String):Void;

    public static function unregisterAll():Void;
}
