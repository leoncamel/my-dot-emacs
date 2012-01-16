;;; my-struct-parser.el --- my c/c++ struct parser utility

;; Copyright (C) 2012  Le0n Zh4ng

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


(require 'semantic)
;; (require 'semantic/tag)

(defun my-region-test (start end)
  "my-region-test"
  (interactive "rp")
  (let ((parsed-results (semantic-parse-region start end)))
    (set-buffer (get-buffer-create "tmp.dot"))
    (graphviz-dot-mode)
    (erase-buffer)
    (goto-char (point-max))
    
    (insert (prin1-to-string parsed-results))
    (insert "--------------------------------")
    (setq my-parse-result parsed-results)
    ;; (insert (prin1-to-string (semantic-tag parse-result :members)))
    ))


;;;;;;;;;;;
;; notes ;;
;;;;;;;;;;;

;; name
;; function: semantic-tag-name

;; members
;; function: semantic-tag-type-members

;;

;; ELISP> (mapcar 'semantic-tag-name
;;                (semantic-tag-type-members
;;                 (semantic-tag-class my-parse-result)))

;; ("header" "stack_size" "dirty" "sp" "stack")


(provide 'my-struct-parser)
;;; my-struct-parser.el ends here
