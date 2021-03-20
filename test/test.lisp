(import
 :default asdf
 :names ((foo-bar bar)
         foo-baz)
 :path "./test-import.mjs")

(defun moo-cow () "COW")
(defun cow-moo () "MOO")
(defun poop () "POOP")

(let ((element (chain document (create-element "h1"))))
  (setf (@ element text-content)
	(+ "Hello world! " (@ asdf a) bar foo-baz))
  (chain document body (append-child element)))

(console-log "test")

(export
 :names
 ((moo-cow moo)
  cow-moo)
 :default poop)
