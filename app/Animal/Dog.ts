/**
 * Created by Tsuyoshi on 2014/11/08.
 */

/// <reference path="BaseAnimal.ts"/>

module Animal {
    export class Dog extends BaseAnimal {
        /**
         *
         * @param name 名前
         */
        constructor (name: string) {
            super(name);
        }

        public cry() {
            console.log('bowwow');
        }
    }
}