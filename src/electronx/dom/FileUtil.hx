package electronx.dom;

import js.html.File;

class FileUtil {
    public static inline function filePath(file:File):String {
        return untyped __js__("file.path");
    }
}
