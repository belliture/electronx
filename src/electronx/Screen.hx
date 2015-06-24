package electronx;

import electronx.Point;
import electronx.Rect;
import electronx.Size;
import electronx.events.ElectronEvent;
import haxe.Constraints.Function;
import js.node.events.EventEmitter;

@:enum abstract ScreenEvent<T:Function>(Event<T>) to Event<T> {
    var DisplayAdded:ScreenEvent<ElectronEvent -> Display -> Void> = "display-added";
    var DisplayRemoved:ScreenEvent<ElectronEvent -> Display -> Void> = "display-removed";
    var DisplayMetricsChanged:ScreenEvent<ElectronEvent -> Display -> Array<String> -> Void> = "display-metrics-changed";
}

@:jsRequire("screen")
extern class Screen extends EventEmitter<Screen> {
    public static function getCursorScreenPoint():Point;

    public static function getPrimaryDisplay():Display;

    public static function getAllDisplays():Array<Display>;

    public static function getDisplayNearestPoint(point:Point):Display;

    public static function getDisplayMatching(rect:Rect):Display;
}

typedef Display = {
    id: Int,
    bounds: Rect,
    workArea: Rect,
    size: Size,
    workAreaSize: Size,
    scaleFactor: Float,
    rotation: Int,
    touchSupport: TouchSupport
}

@:enum abstract TouchSupport(Int) to Int {
    var Unknown = 0;
    var Available = 1;
    var Unavailable = 2;
}
