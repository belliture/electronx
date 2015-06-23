package electronx;

abstract WH(Array<Int>) from Array<Int> to Array<Int> {
    inline public function new(wh:Array<Int>) this = wh;

    inline public function width():Int {
        return this[0];
    }

    inline public function height():Int {
        return this[1];
    }
}
