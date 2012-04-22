;;; init_autoinsert.el --- auto-insert

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

(require 'autoinsert)
(auto-insert-mode)  ;;; Adds hook to find-files-hook

;; Or use custom, *NOTE* Trailing slash important :: TODO ?
(setq auto-insert-directory
      (my-dotfile "/etc/autoinsert-template/"))

;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
;(define-auto-insert "\.py" "my-python-template.py")
;(define-auto-insert "\.php" "my-php-template.php")
;(define-auto-insert "\.cpp" "my-cpp-template.cpp")
;(define-auto-insert "main.cpp" "my-main-cpp-template.cpp")

;; reference:
;; http://www.02.246.ne.jp/~torutk/cxx/emacs/mode_extension.html
(require 'cl)

(setq auto-insert-alist
      (append '(("main\\.cpp$" . ["my-main-cpp-template.cpp" my-template])
                ("main\\.c$"   . ["my-main-c-template.c"     my-template])
                ("\\.cpp$"     . ["my-cpp-template.cpp"      my-template])
                ("\\.hpp$"     . ["my-cpp-template.h"        my-template])
                ("\\.h$"       . ["my-h-template.h"          my-template])
                ("\\.c$"       . ["my-c-template.h"          my-template])
                ("\\.org"      . ["my-org-template.org"      my-template])
              ) auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)


(defvar template-replacements-alists
  '(("%file%" . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () 
          (setq file-without-ext (file-name-sans-extension
                                   (file-name-nondirectory (buffer-file-name))))))
    ("%namespace%" .
         (lambda () (setq namespace (read-from-minibuffer "namespace: "))))
    ("%include%" .
         (lambda () 
           (cond ((string= namespace "") (concat "\"" file-without-ext ".h\""))
                 (t (concat "<" (replace-regexp-in-string "::" "/" namespace) "/"
                            file-without-ext ".h>")))))
    ("%include-guard%" . 
         (lambda ()
           (format "%s_H_"
                   (upcase (concat 
                             (replace-regexp-in-string "::" "_" namespace)
                             (unless (string= namespace "") "_")
                             file-without-ext)))))
    ("%name%" . user-full-name)
    ("%mail%" . (lambda () (identity user-mail-address)))
    ("%cyear%" . (lambda () (substring (current-time-string) -4)))
    ("%bdesc%" . (lambda () (read-from-minibuffer "Brief description: ")))
    ("%namespace-open%" .
       (lambda ()
         (cond ((string= namespace "") "")
               (t (progn 
                   (setq namespace-list (split-string namespace "::"))
                   (setq namespace-text "")
                   (while namespace-list
                     (setq namespace-text (concat namespace-text "namespace "
                                                 (car namespace-list) " {\n"))
                     (setq namespace-list (cdr namespace-list))
                   )
                   (eval namespace-text))))))
    ("%namespace-close%" .
       (lambda ()
         (cond ((string= namespace "") "")
               (t (progn
                   (setq namespace-list (reverse (split-string namespace "::")))
                   (setq namespace-text "")
                   (while namespace-list
                      (setq namespace-text (concat namespace-text "} // " (car namespace-list) "\n"))
                      (setq namespace-list (cdr namespace-list))
                   )
                   (eval namespace-text))))))
    ))

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        template-replacements-alists)
  (goto-char (point-max))
  (message "done."))

(provide 'init_autoinsert)
;;; init_autoinsert.el ends here
