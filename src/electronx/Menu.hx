package electronx;

@:jsRequire("menu")
extern class Menu {
    public static function setApplicationMenu(menu:Menu):Void;

    public static function sendActionToFirstResponder(action:String):Void;

    public static function buildFromTemplate(template:Array<MenuTemplate>):Menu;


    public var items(default,null):Array<MenuItem>;

    public function new();

    @:overload(function(browserWindow:BrowserWindow):Void {})
    public function popup(browserWindow:BrowserWindow, x:Int, y:Int):Void;

    public function append(menuItem:MenuItem):Void;

    public function insert(pos:Int, menuItem:MenuItem):Void;
}

@:jsRequire("menu-item")
extern class MenuItem {
    public function new(options:MenuItemOption);
}

@:enum abstract MenuItemType(String) to String {
    var Normal = "normal";
    var Separator = "separator";
    var Submenu = "submenu";
    var Checkbox = "checkbox";
    var Radio = "radio";
}

typedef MenuItemOption = {
    click: Void -> Void,
    selector: String,
    type: MenuItemType,
    label: String,
    sublabel: String,
    accelerator: String,
    icon: NativeImage,
    enabled: Bool,
    visible: Bool,
    checked: Bool,
    submenu: Menu,
    id: String,
    position: String
}

typedef MenuTemplate = {
    click: Void -> Void,
    selector: String,
    type: MenuItemType,
    label: String,
    sublabel: String,
    accelerator: String,
    icon: NativeImage,
    enabled: Bool,
    visible: Bool,
    checked: Bool,
    submenu: Array<MenuTemplate>,
    id: String,
    position: String
}
