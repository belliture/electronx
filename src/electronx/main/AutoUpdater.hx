package electronx.main;

import haxe.Constraints.Function;
import electronx.events.ElectronEvent;
import js.node.events.EventEmitter;

@:enum abstract AutoUpdaterEvent<T:Function>(Event<T>) to Event<T> {
    var Error:AutoUpdaterEvent<ElectronEvent -> String -> Void> = "error";
    var CheckingForUpdate:AutoUpdaterEvent<Void -> Void> = "checking-for-update";
    var UpdateAvailable:AutoUpdaterEvent<Void -> Void> = "update-available";
    var UpdateNotAvailable:AutoUpdaterEvent<Void -> Void> = "update-not-available";
    var UpdateDownloaded:AutoUpdaterEvent<ElectronEvent -> String -> String -> Date -> String -> Function> = "update-downloaded";
}

@:jsRequire("auto-updater")
extern class AutoUpdater extends EventEmitter<AutoUpdater> {
    public static function setFeedUrl(url:String):Void;
    public static function checkForUpdates():Void;
}
