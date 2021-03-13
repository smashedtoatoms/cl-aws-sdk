(defpackage #:aws-sdk-cl/session
  (:use #:cl)
  (:import-from #:aws-sdk-cl/credentials
                #:credentials)
  (:export #:session
           #:session-credentials
           #:session-region))
(in-package #:aws-sdk-cl/session)

(defvar *session* nil)

(defstruct (session (:constructor %make-session))
  (credentials nil :type (or credentials null))
  (region nil :type (or string null)))
