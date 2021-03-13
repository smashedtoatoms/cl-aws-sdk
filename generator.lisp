(uiop:define-package #:aws-sdk-cl/generator
  (:use #:cl)
  (:use-reexport #:aws-sdk-cl/generator/shape)
  (:use-reexport #:aws-sdk-cl/generator/operation)
  (:use-reexport #:aws-sdk-cl/generator/service))
