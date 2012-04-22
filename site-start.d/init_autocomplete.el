;;; init_autocomplete.el --- auto-complete settings

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

(setq ac-comphist-file (my-dotfile-var "ac-comphist.dat"))

;; tell emacs where to read abbrev
(setq abbrev-file-name (my-dotfile-var "abbrev_defs"))

;; (add-to-list 'load-path (my-dotfile-vendor "ac"))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (my-dotfile "/vendor/ac/ac-dict"))
;; (ac-config-default)

; TODO: auto-complete mode has strange problems
;       this mode is quite strange while integration with yasnippet
(add-to-list 'load-path
             (my-dotfile "vendor/auto-complete/"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (my-dotfile "vendor/auto-complete/dict/"))
(ac-config-default)

;; auto-complete for haskell-mode
;; reference : http://madscientist.jp/~ikegami/diary/20090215.html
(require 'init_ac_hs)

;; (require 'auto-complete-config)
;; (require 'auto-complete-yasnippet)
;; (require 'auto-complete-etags)
;; (require 'auto-complete-extension)
;; (require 'auto-complete-octave)
;; (require 'auto-complete+)
;; (require 'leon/util)
;; 
;; ;; After do this, isearch any string, M-: (match-data) always
;; ;; return the list whose elements is integer
;; (global-auto-complete-mode 1)
;; 
;; ;(eal-define-keys
;; ; 'ac-complete-mode-map
;; ; `(("<return>"   nil)
;; ;   ("RET"        nil)
;; ;   ("M-j"        ac-complete)))
;; 
;; (defun auto-complete-settings ()
;;   "Settings for `auto-complete'."
;;   ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;;   ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;;   ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
;;   (add-to-list 'ac-dictionary-directories
;;                 (my-dotfile "vendor/auto-complete/dict/"))
;; 
;;   (setq ac-auto-show-menu t
;;         ac-auto-start t
;;         ac-dwim t
;;         ac-candidate-limit ac-menu-height)
;; 
;;   (set-default 'ac-sources
;;                '(ac-source-semantic
;;                  ac-source-yasnippet
;;                  ac-source-abbrev
;;                  ac-source-words-in-buffer
;;                  ac-source-words-in-all-buffer
;;                  ac-source-imenu
;;                  ac-source-files-in-current-dir
;;                  ac-source-filename))
;;   (setq ac-modes ac+-modes)
;; 
;;   (defun ac-start-use-sources (sources)
;;     (interactive)
;;     (let ((ac-sources sources))
;;       (call-interactively 'ac-start))))
;; 
;; (eval-after-load "auto-complete"
;;   '(auto-complete-settings))
;; 
;; (eval-after-load "cc-mode"
;;   '(ac-settings-4-cc))
;; (defun ac-settings-4-cc ()
;;   "`auto-complete' settings for `cc-mode'."
;;      (dolist (command `(c-electric-backspace
;;                         c-electric-backspace-kill))
;;        (add-to-list 'ac-trigger-commands-on-completing command)))
;; 
;; (defun ac-settings-4-autopair ()
;;   "`auto-complete' settings for `autopair'."
;;   (defun ac-trigger-command-p (command)
;;     "Return non-nil if `this-command' is a trigger command."
;;     (or
;;      (and
;;       (symbolp command)
;;       (or (memq command ac-trigger-commands)
;;           (string-match "self-insert-command" (symbol-name command))
;;           (string-match "electric" (symbol-name command))
;;           (let* ((autopair-emulation-alist nil)
;;                  (key (this-single-command-keys))
;;                  (beyond-autopair (or (key-binding key)
;;                                       (key-binding (lookup-key local-function-key-map key)))))
;;             (or
;;              (memq beyond-autopair ac-trigger-commands)
;;              (and ac-completing
;;                   (memq beyond-autopair ac-trigger-commands-on-completing)))))))))
;;       
;; (eval-after-load "autopair"
;;   '(ac-settings-4-autopair))
;; 
;; (defun ac-settings-4-lisp ()
;;   "Auto complete settings for lisp mode."
;;   (setq ac-omni-completion-sources '(("\\<featurep\s+'" ac+-source-elisp-features)
;;                                      ("\\<require\s+'"  ac+-source-elisp-features)
;;                                      ("\\<load\s+\""    ac-source-emacs-lisp-features)))
;;   (ac+-apply-source-elisp-faces)
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-symbols
;;           ;; ac-source-semantic
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ;; ac-source-imenu
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-java ()
;;   (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
;;                                          (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-c ()
;;   (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
;;                                          (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-cpp ()
;;   (setq ac-omni-completion-sources
;;         (list (cons "\\." '(ac-source-semantic))
;;               (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-c++-keywords
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-text ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-imenu)))
;; 
;; (defun ac-settings-4-eshell ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename
;;           ac-source-symbols
;;           ac-source-imenu)))
;; 
;; (defun ac-settings-4-ruby ()
;;   (require 'rcodetools-settings)
;;   (setq ac-omni-completion-sources
;;         (list (cons "\\." '(ac-source-rcodetools))
;;               (cons "::" '(ac-source-rcodetools)))))
;; 
;; (defun ac-settings-4-html ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-tcl ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (defun ac-settings-4-awk ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
;; 
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   svn-log-edit-mode-hook change-log-mode-hook)
;;  'ac-settings-4-lisp)
;; 
;; (apply-args-list-to-fun
;;  (lambda (hook fun)
;;    (am-add-hooks hook fun))
;;  `(('java-mode-hook   'ac-settings-4-java)
;;    ('c-mode-hook      'ac-settings-4-c)
;;    ('c++-mode-hook    'ac-settings-4-cpp)
;;    ('text-mode-hook   'ac-settings-4-text)
;;    ('eshell-mode-hook 'ac-settings-4-eshell)
;;    ('ruby-mode-hook   'ac-settings-4-ruby)
;;    ('html-mode-hook   'ac-settings-4-html)
;;    ('java-mode-hook   'ac-settings-4-java)
;;    ('awk-mode-hook    'ac-settings-4-awk)
;;    ('tcl-mode-hook    'ac-settings-4-tcl)))
;; 
;; (eal-eval-by-modes
;;  ac-modes
;;  (lambda (mode)
;;    (let ((mode-name (symbol-name mode)))
;;      (when (and (intern-soft mode-name) (intern-soft (concat mode-name "-map")))
;;        (define-key (symbol-value (am-intern mode-name "-map")) (kbd "C-c a") 'ac-start)))))
;;

(provide 'init_autocomplete)
;;; init_autocomplete.el ends here
