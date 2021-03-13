(uiop:define-package #:aws-sdk-cl
  (:nicknames #:aws-sdk-cl/main #:aws)
  (:use #:cl)
  (:use-reexport #:aws-sdk-cl/session
                 #:aws-sdk-cl/make-session
                 #:aws-sdk-cl/credentials
                 #:aws-sdk-cl/api)
  (:import-from #:aws-sdk-cl/utils/config
                #:*aws-profile*)
  (:export #:*aws-profile*))
(in-package #:aws-sdk-cl)
