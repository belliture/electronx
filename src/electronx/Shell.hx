package electronx;

@:jsRequire("shell")
extern class Shell {
    public static function showItemInFolder(fullPath:String):Void;

    public static function openItem(fullPath:String):Void;

    public static function openExternal(url:String):Bool;

    public static function moveItemToTrash(fullPath:String):Bool;

    public static function beep():Void;
}
