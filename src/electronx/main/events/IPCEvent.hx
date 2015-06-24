package electronx.main.events;

import electronx.main.WebContents;

extern class IPCEvent {
    public var returnValue(default,default):Dynamic;

    public var sender(default,null):WebContents;
}
