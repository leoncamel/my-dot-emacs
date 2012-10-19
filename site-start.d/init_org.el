;;; init_org.el --- org-mode settings

;; Copyright (C) 2011,2012  Le0n Zh4ng

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

;; org-mode
;(add-to-list 'load-path (my-dotfile-vendor "org-6.35i/lisp/"))
;(add-to-list 'load-path (my-dotfile-vendor "org-6.35i/contrib/lisp/"))
;(require 'org-install)
;(require 'org-babel-init)
;(require 'org-babel-R)
;(require 'org-babel-python)
;;(org-babel-load-library-of-label)

;; (add-to-list 'load-path (my-dotfile-vendor "org-7.3/lisp/"))
;; (add-to-list 'load-path (my-dotfile-vendor "org-7.3/contrib/lisp"))
(require 'org-install)
(require 'ob-tangle)
(require 'ob-python)
(require 'ob-ruby)
(require 'ob-R)
(require 'ob-haskell)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Override
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key [(control meta return)] 'org-insert-heading)
            (local-set-key [(control shift left)] 'previous-buffer)
            (local-set-key [(control shift right)] 'next-buffer)
            (local-set-key [(meta shift right)] 'ido-switch-buffer)
            (local-set-key [(meta shift left)] 'magit-status)
            ))

(setq org-directory "~/work/org-doc/")
(setq org-mobile-directory "~/Dropbox/MobileOrg/")
(setq org-agenda-files (file-expand-wildcards "~/work/org-doc/mobile.org"))
(setq org-mobile-inbox-for-pull "~/work/org-doc/mobile-inbox.org")

;; Enable encryption
;(setq org-mobile-use-encryption t)
;; Set a password
;(setq org-mobile-encryption-password "")

;; (setq org-agenda-custom-commands
;;     '(("w" todo "WAITING" nil)
;;     ("n" todo "NEXT" nil)
;;     ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT"))))
;; )
(setq org-todo-keywords
      '((type  "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "|" "DONE(d)" "CANCELLED(c)" "DEFERRED(f)")
        (sequence "PROJECT(p)" "READING(r)" "SHOPPING(o)" "|" "FINISHED(f)")
        (sequence "INVOICE(i)" "SENT(n)" "|" "RECVD(r)")))

(defun gtd ()
   (interactive)
   (find-file "~/work/org-doc/gtd/gtd.org")
   )
;; (setq org-export-with-LaTeX-fragments t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Org-mode XeLaTeX Export Settings
;;   Configure org-mode to export directly to PDF using latex or
;;   xelatex, compiling the bibliography as it goes, with my preferred
;;   xelatex setup.
;;
(require 'org-latex)
;; (setq org-export-latex-classes
;;       (cons '("article"
;;               "\\documentclass{article}
;; [NO-DEFAULT-PACKAGES]
;; \\usepackage{amsmath}
;; \\usepackage[utf8]{inputenc}
;; \\usepackage[OT2,T1]{fontenc}
;; \\usepackage{fixltx2e}
;; \\usepackage{graphicx}
;; \\usepackage{longtable}
;; \\usepackage{float}
;; \\usepackage{wrapfig}
;; \\usepackage{soul}
;; \\usepackage{t1enc}
;; \\usepackage{textcomp}
;; \\usepackage{marvosym}
;; \\usepackage{wasysym}
;; \\usepackage{latexsym}
;; \\usepackage{amssymb}
;; \\usepackage{hyperref}
;; \\usepackage{xeCJK}
;; [EXTRA]
;; [PACKAGES]
;; %\\setCJKmainfont{Hei}            % default font for Mac
;; "
;;               ("\\section{%s}" . "\\section*{%s}")
;;               ("\\subsection{%s}" . "\\subsection*{%s}")
;;               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;               ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;             org-export-latex-classes))

;; (setq org-latex-to-pdf-process
;;         '("xelatex -interaction nonstopmode %b"
;;           "bibtex %b"
;;           "xelatex -interaction nonstopmode %b"
;;           "xelatex -interaction nonstopmode %b"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; minted setup for org-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; reference : newsmth

(setq org-src-fontify-natively t)
(setq org-export-latex-minted t)
(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(add-to-list 'org-export-latex-minted-langs '(ocaml "ocaml"))
(add-to-list 'org-export-latex-minted-langs '(haskell "haskell"))
(add-to-list 'org-export-latex-minted-langs '(clojure "clojure"))
(add-to-list 'org-export-latex-minted-langs '(erlang "erlang"))
(setq org-export-latex-listings 'minted)
(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode %f"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; bibtex
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

; another bibtex tweaking
(require 'org-bibtex)



(provide 'init_org)
;;; init_org.el ends here
