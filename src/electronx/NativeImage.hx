package electronx;

import electronx.Size;
import js.node.Buffer;

@:jsRequire("native-image")
extern class NativeImage {
    public static function createEmpty():NativeImage;

    public static function createFromPath(path:String):NativeImage;

    public static function createFromBuffer(buffer:Buffer, ?scaleFactor:Float):NativeImage;

    public static function createFromDataUrl(dataUrl:String):NativeImage;


    public function toPng():Buffer;

    public function toJpeg(quality:Int):Buffer;

    public function toDataUrl():String;

    public function isEmpty():Bool;

    public function getSize():Size;
    
    public function setTemplateImage(option:Bool):Void;
}
