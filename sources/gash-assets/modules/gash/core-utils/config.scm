;;; Gash --- Guile As SHell
;;; Copyright © 2018 Jan (janneke) Nieuwenhuizen <janneke@gnu.org>
;;;
;;; This file is part of Gash.
;;;
;;; Gash is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; Gash is distributed in the hope that it will be useful, but WITHOUT ANY
;;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;;; details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Gash.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gash core-utils config)
  #:export (%bzip2
            %xz
            %compress
            %gzip
            %version))

;;; Commentary:
;;;
;;; Compile-time configuration of gash.  When adding a substitution variable
;;; here, make sure to have configure substitute it.
;;;
;;; Code:

(define %version
  "0.0.214-fc1b")

(define %bzip2
  "bzip2")

(define %compress
  "compress")

(define %gzip
  "gzip")

(define %xz
  "xz")
