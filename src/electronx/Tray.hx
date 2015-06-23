package electronx;

import electronx.Menu;
import electronx.Rect;
import electronx.events.ElectronEvent;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.node.events.EventEmitter;

@:enum abstract TrayEvent<T:Function>(Event<T>) to Event<T> {
    var Clicked:TrayEvent<ElectronEvent -> Rect -> Void> = "clicked";
    var DoubleClicked:TrayEvent<Void -> Void> = "double-clieked";
    var BalloonShow:TrayEvent<Void -> Void> = "balloon-show";
    var BalloonClicked:TrayEvent<Void -> Void> = "balloon-clicked";
    var BalloonClosed:TrayEvent<Void -> Void> = "balloon-closed";
}

@:jsRequire("tray")
extern class Tray extends EventEmitter<Tray> {
    public function new(image:EitherType<NativeImage, String>);

    public function destroy():Void;

    public function setImage(image:EitherType<NativeImage, String>):Void;

    public function setPressedImage(image:EitherType<NativeImage, String>):Void;

    public function setToolTip(toolTip:String):Void;

    public function setTitle(title:String):Void;

    public function setHighlightMode(highlight:Bool):Void;

    public function displayBalloon(options:BalloonOption):Void;

    public function setCotextMenu(menu:Menu):Void;
}

typedef BalloonOption = {
    icon: NativeImage,
    title: String,
    content: String
}
