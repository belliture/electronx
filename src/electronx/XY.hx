package electronx;

abstract XY(Array<Int>) from Array<Int> to Array<Int> {
    inline public function new(xy:Array<Int>) this = xy;

    inline public function x():Int {
        return this[0];
    }

    inline public function y():Int {
        return this[1];
    }
}
