/**
 * Created by Tsuyoshi on 2014/11/08.
 */

module Animal {
    export class BaseAnimal {
        /**
         *
         * @param name 名前
         */
        constructor (public name: string ) {}

        /**
         * 鳴き声(サブクラスで実装)
         */
        public cry () {
            throw new Error('override me');
        }
    }
}