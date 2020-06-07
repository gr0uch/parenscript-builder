;; Condensed form of console.log.
(defmacro console-log (&body forms)
  `(chain console (log ,@forms)))
