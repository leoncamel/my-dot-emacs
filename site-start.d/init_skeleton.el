;;; init_skeleton.el --- skeleton settings

;; Copyright (C) 2011  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(define-skeleton sexpr-example
  "Insert a silly example."
  ""
  > "Emacs version is: " emacs-version \n
  > "And time is: " (current-time-string))

(define-skeleton insert-c-comment-header
  "Inserts a c comment in a rectangle into current buffer."
  ""
  '(setq str (skeleton-read "Comment: "))
  ;; `str' is set explicitly here, because otherwise the skeleton
  ;; program would set it, only when it is going to insert it into the
  ;; buffer. But we need to determine the length of the string
  ;; beforehand, with `(length str)' below.
  '(when (string= str "") (setq str " - "))
  '(setq v1 (make-string (- fill-column 6) ?*))
  '(setq v2 (- fill-column 10 (length str)))
  "/* " v1 " */" \n
  "/* **"
  (make-string (floor v2 2) ?\ )
  str
  (make-string (ceiling v2 2) ?\ )
  "** */" \n
  "/* " v1 " */")

/* ************************************************************************** */
/* **                                hello                                 ** */
/* ************************************************************************** */

(provide 'init_skeleton)
;;; init_skeleton.el ends here
