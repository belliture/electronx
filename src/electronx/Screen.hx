package electronx;

import electronx.Point;
import electronx.Rect;
import electronx.Size;
import electronx.events.ElectronEvent;
import haxe.Constraints.Function;
import js.Lib;
import js.node.events.EventEmitter;

@:enum abstract ScreenEvent<T:Function>(Event<T>) to Event<T> {
    var DisplayAdded:ScreenEvent<ElectronEvent -> Display -> Void> = "display-added";
    var DisplayRemoved:ScreenEvent<ElectronEvent -> Display -> Void> = "display-removed";
    var DisplayMetricsChanged:ScreenEvent<ElectronEvent -> Display -> Array<String> -> Void> = "display-metrics-changed";
}

extern class Screen extends EventEmitter<Screen> {
    @:extern public static inline function require():Screen return Lib.require("screen");

    public function getCursorScreenPoint():Point;

    public function getPrimaryDisplay():Display;

    public function getAllDisplays():Array<Display>;

    public function getDisplayNearestPoint(point:Point):Display;

    public function getDisplayMatching(rect:Rect):Display;
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
