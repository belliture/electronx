package electronx.renderer;

@:jsRequire("web-frame")
extern class WebFrame {
    public static function setZoomFactor(factor:Float):Float;

    public static function getZoomFactor():Float;

    public static function setZoomLevel(level:Float):Float;

    public static function getZoomLevel():Float;

    public static function setSpellCheckProvider(language:String, autoCorrectWord:Bool, provider:SpellCheck):Void;

    public static function registerUrlSchemeAsSecure(scheme:String):Void;
}

typedef SpellCheck = {
    spellCheck: String -> Bool
}
