package electronx;

@:jsRequire("crash-reporter")
extern class CrashReporter {
    public static function start(options:ReportOption):Void;

    public static function getLastCrashReport():Null<ReportResult>;

    public static function getUploadedReports():Array<ReportResult>;
}

typedef ReportOption = {
    ?productName: String,
    ?companyName: String,
    ?submitUrl: String,
    ?autoSubmit: Bool,
    ?ignoreSystemCrashHandler: Bool,
    ?extra: Dynamic<String>
}

typedef ReportResult = {
    date: Date,
    id: String
}
