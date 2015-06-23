package electronx.events;

extern class ElectronEvent {
    public function preventDefault():Void;
    
    public function sendReply(json:String):Bool;
}
