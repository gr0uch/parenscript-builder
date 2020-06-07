var __PS_MV_REG;
/* (IMPORT DEFAULT ASDF NAMES (FOO-BAR FOO-BAZ) PATH ./test-import.mjs) */
import asdf from "./test-import.mjs";
import { fooBar, fooBaz, } from "./test-import.mjs";

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
     (SETF (@ ELEMENT TEXT-CONTENT)
             (+ Hello world!  (@ ASDF A) FOO-BAR FOO-BAZ))
     (CHAIN DOCUMENT BODY (APPEND-CHILD ELEMENT))) */
(function () {
    var element = document.createElement('h1');
    element.textContent = 'Hello world! ' + asdf.a + fooBar + fooBaz;
    return document.body.appendChild(element);
})();
/* (EXPORT NAMES (MOO-COW COW-MOO) DEFAULT POOP) */
export { mooCow, cowMoo, };
export default poop;

