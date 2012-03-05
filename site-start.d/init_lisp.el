;;; init_lisp.el --- lisp-mode settings

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

(defun esk-turn-on-paredit ()
  (paredit-mode t))


(defun esk-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)
;; (add-hook 'emacs-lisp-mode-hook 'esk-prog-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

(define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)

;;; Enhance Lisp Modes

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; TODO: look into parenface package
(defface esk-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(dolist (mode '(scheme emacs-lisp lisp clojure))
  (when (> (display-color-cells) 8)
    (font-lock-add-keywords (intern (concat (symbol-name mode) "-mode"))
                            '(("(\\|)" . 'esk-paren-face))))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            'esk-turn-on-paredit)
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            'esk-turn-on-paredit))

;;;;;;;;;;;;
;; Scheme ;;
;;;;;;;;;;;;
(add-to-list 'load-path (my-file-path-join dotfiles-dir "/vendor/quack"))
(eval-after-load "quack"
  '(progn
     (setq quack-default-program "mzscheme")
     (setq quack-global-menu-p nil)
     (setq quack-dir (my-file-path-join dotfiles-dir "/var/quack"))
     (make-directory quack-dir t)
     ))
(require 'quack)

(provide 'init_lisp)
;;; init_lisp.el ends here
