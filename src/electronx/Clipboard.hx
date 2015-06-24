package electronx;

import electronx.NativeImage;
import haxe.extern.EitherType;

@:jsRequire("clipboard")
extern class Clipboard {
    public static function readText(?type:String):String;

    public static function writeText(text:String, ?type:String):Void;

    public static function readHtml(?type:String):String;

    public static function writeHtml(markup:String, ?type:String):Void;

    public static function readImage(?type:String):NativeImage;

    public static function writeImage(image:EitherType<NativeImage, String>, ?type:String):Void;

    public static function clear(?type:String):Void;

    public static function availableFormats(?type:String):Array<String>;

    public static function has(data:String, ?type:String):Bool;

    public static function read(data:String, ?type:String):String;
}
