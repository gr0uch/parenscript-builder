var __PS_MV_REG;
/* (DEFMACRO CONSOLE-LOG (&BODY FORMS) `(CHAIN CONSOLE (LOG ,@FORMS))) */

/* (IMPORT DEFAULT ASDF NAMES (FOO-BAR AS BAR FOO-BAZ) PATH ./test-import.mjs) */
import asdf from "./test-import.mjs";
import { fooBar as bar, fooBaz, } from "./test-import.mjs";

/* (DEFUN MOO-COW () COW) */
function mooCow() {
    return 'COW';
};
/* (DEFUN COW-MOO () MOO) */
function cowMoo() {
    return 'MOO';
};
/* (DEFUN POOP () POOP) */
function poop() {
    return 'POOP';
};
/* (LET ((ELEMENT (CHAIN DOCUMENT (CREATE-ELEMENT h1))))
     (SETF (@ ELEMENT TEXT-CONTENT) (+ Hello world!  (@ ASDF A) BAR FOO-BAZ))
     (CHAIN DOCUMENT BODY (APPEND-CHILD ELEMENT))) */
(function () {
    var element = document.createElement('h1');
    element.textContent = 'Hello world! ' + asdf.a + bar + fooBaz;
    return document.body.appendChild(element);
})();
/* (CONSOLE-LOG test) */
console.log('test');
/* (EXPORT NAMES (MOO-COW AS MOO COW-MOO) DEFAULT POOP) */
export { mooCow as moo, cowMoo, };
export default poop;

