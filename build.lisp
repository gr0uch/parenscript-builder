(require :parenscript)

;; add 'import' to compiler
(ps:defpsmacro
 import (&key default names path)
 (when default
   (write-string
    (concatenate 'string "import "
                 (ps:symbol-to-js-string default) " from \"" path "\";"))
   (fresh-line))
 (when names
   (write-string "import {")
   (loop
    for i from 0 to (length names)
    for name in names
    do
    (write-string (concatenate 'string  " " (ps:symbol-to-js-string name)))
    (when (not (or (string= (symbol-name name) "AS")
                   (string= (symbol-name (nth (+ i 1) names)) "AS")))
         (write-string ",")))
   (write-string (concatenate 'string  " } from \"" path "\";"))
   (fresh-line))
 nil)

;; add 'export' to compiler
(ps:defpsmacro
 export (&key names default)
 (when names
   (write-string "export {")
   (loop
    for i from 0 to (length names)
    for name in names
    do
    (write-string (concatenate 'string  " " (ps:symbol-to-js-string name)))
    (when (not (or (string= (symbol-name name) "AS")
                   (string= (symbol-name (nth (+ i 1) names)) "AS")))
         (write-string ",")))
   (write-string " };")
   (fresh-line))
 (when default
   (write-string (concatenate 'string "export default "
                              (ps:symbol-to-js-string default) ";"))
   (fresh-line))
 nil)

(defun ps2js (f)
  (in-package :ps)
  (do
   ((form (read f nil) (read f nil)))
   ((not form))
   (format t  "/* ~A */~%" form)
   (format t "~A~%" (ps:ps* form))))

(defun main (argv)
  ;; Set internal variable
  (format t "~A~%" (ps:ps (defvar *__ps_mv_reg*)))
  (pop argv)
  (loop for arg in argv do
        (let ((probe-results (probe-file arg)))
          (when probe-results
            (with-open-file
             (f arg)
             (handler-bind
                 ((error
                   (lambda (e)
                     (format *error-output* "~A~%" e)
                     (sb-ext:exit :code 1))))
               (ps2js f)))))))
