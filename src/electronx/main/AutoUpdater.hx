package electronx.main;

import haxe.Constraints.Function;
import electronx.events.ElectronEvent;
import js.Lib;
import js.node.events.EventEmitter;

@:enum abstract AutoUpdaterEvent<T:Function>(Event<T>) to Event<T> {
    var Error:AutoUpdaterEvent<ElectronEvent -> String -> Void> = "error";
    var CheckingForUpdate:AutoUpdaterEvent<Void -> Void> = "checking-for-update";
    var UpdateAvailable:AutoUpdaterEvent<Void -> Void> = "update-available";
    var UpdateNotAvailable:AutoUpdaterEvent<Void -> Void> = "update-not-available";
    var UpdateDownloaded:AutoUpdaterEvent<ElectronEvent -> String -> String -> Date -> String -> Function> = "update-downloaded";
}

extern class AutoUpdater extends EventEmitter<AutoUpdater> {
    @:extern public static inline function require():AutoUpdater return Lib.require("auto-updater");

    public function setFeedUrl(url:String):Void;

    public function checkForUpdates():Void;
}
