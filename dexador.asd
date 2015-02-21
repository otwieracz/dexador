#|
  This file is a part of dexador project.
  Copyright (c) 2015 Eitaro Fukamachi (e.arrows@gmail.com)
|#

#|
  Author: Eitaro Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage dexador-asd
  (:use :cl :asdf))
(in-package :dexador-asd)

(defsystem dexador
  :version "0.1"
  :author "Eitaro Fukamachi"
  :license "MIT"
  :depends-on (:lev
               :fast-http
               :quri)
  :components ((:module "src"
                :components
                ((:file "dexador"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op dexador-test))))
