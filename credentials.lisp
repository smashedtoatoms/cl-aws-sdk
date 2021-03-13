(defpackage #:aws-sdk-cl/credentials
  (:use #:cl)
  (:import-from #:aws-sdk-cl/credentials/base
                #:make-credentials
                #:credentials
                #:retrieve
                #:credentials-keys
                #:credentials-headers)
  (:import-from #:aws-sdk-cl/credentials/env
                #:env-provider)
  (:import-from #:aws-sdk-cl/credentials/shared
                #:shared-provider)
  (:import-from #:aws-sdk-cl/credentials/ec2role
                #:ec2role-provider)
  (:export #:credentials
           #:make-credentials
           #:default-aws-credentials
           #:credentials-keys
           #:credentials-headers))
(in-package #:aws-sdk-cl/credentials)

(defvar *chained-providers*
  (list (make-instance 'env-provider)
        (make-instance 'shared-provider)
        (make-instance 'ec2role-provider)))

(defun default-aws-credentials ()
  (loop for provider in *chained-providers*
        for credentials = (retrieve provider)
        when credentials
        do (return credentials)))
