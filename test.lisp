(import
 :default asdf
 :names (foo-bar foo-baz)
 :path "./test-import.mjs")

(defun moo-cow () "COW")
(defun cow-moo () "MOO")
(defun poop () "POOP")

(let ((element (chain document (create-element "h1"))))
  (setf (@ element text-content)
	(+ "Hello world! " (@ asdf a) foo-bar foo-baz))
  (chain document body (append-child element)))

(export
 :names (moo-cow cow-moo)
 :default poop)
