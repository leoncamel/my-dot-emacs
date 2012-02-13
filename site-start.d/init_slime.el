;;; init_slime.el --- SLIME settings

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


(add-to-list 'load-path
             (my-file-path-join dotfiles-dir "vendor/slime.git"))
(add-to-list 'load-path
             (my-file-path-join dotfiles-dir "vendor/slime.git/contrib/"))

(setq inferior-lisp-program "sbcl")
(setq slime-net-coding-system 'utf-8-unix) ; 文字コードの指定
(setq slime-startup-animation nil)
(setq slime-truncate-lines nil)


(require 'slime)
(slime-setup '(slime-fancy))

;; slime implementations
(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-repl))
     (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
     (defun slime-clojure ()
       (interactive)
       (slime 'clojure))
     (defun slime-sbcl ()
       (interactive)
       (slime 'sbcl))
     ))

(provide 'init_slime)
;;; init_slime.el ends here
