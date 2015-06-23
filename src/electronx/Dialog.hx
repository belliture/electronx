package electronx;

import electronx.BrowserWindow;
import electronx.NativeImage;

@:jsRequire("dialog")
extern class Dialog {
    public static function showOpenDialog(?browserWindow:BrowserWindow, ?options:OpenDialogOption, ?callback:Array<String> -> Void):Void;

    public static function showSaveDialog(?browserWindow:BrowserWindow, ?options:SaveDialogOption, ?callback:String -> Void):Void;

    @:overload(function(options:MessageBoxOption, ?callback:Int -> Void):Void {})
    public static function showMessageBox(browserWindow:BrowserWindow, options:MessageBoxOption, ?callback:Int -> Void):Void;

    public static function showErrorBox(title:String, content:String):Void;
}

@:enum abstract DialogProperty(String) to String {
    var OpenFile = "openFile";
    var OpenDirectory = "openDirectory";
    var MultiSelections = "multiSelections";
    var CreateDirectory = "createDirectory";
}

typedef Filter = {
    name: String,
    extensions: Array<String>
}

typedef OpenDialogOption = {
    title: String,
    defaultPath: String,
    filters: Array<Filter>,
    properties: Array<DialogProperty>
}

typedef SaveDialogOption = {
    title: String,
    defaultPath: String,
    filters: Array<Filter>
}

typedef MessageBoxOption = {
    type: String,
    buttons: Array<String>,
    title: String,
    message: String,
    detail: String,
    icon: NativeImage
}
