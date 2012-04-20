;;; init_el-get.el --- el-get settings

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

;; reference :: emacs-prelude

;;;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;;;; 
;;;; ;; TODO: Now, I use gitsubmodule to manage el-get
;;;; ;;       So, ...
;;;; (require 'el-get)
;;;; 
;;;; (setq el-get-notify-type 'message)
;;;; 
;;;; ;; (unless (require 'el-get nil t)
;;;; ;;   (with-current-buffer
;;;; ;;       (url-retrieve-synchronously
;;;; ;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;;; ;;     (end-of-buffer)
;;;; ;;     (eval-print-last-sexp)))
;;;; 
;;;; (setq el-get-sources
;;;;       '((:name magit
;;;;          :post-init (progn
;;;;                       (global-set-key (kbd "C-x g") 'magit-status)))
;;;;         ;;; ( :name cedet
;;;;         ;;;   :website "http://cedet.sourceforge.net/"
;;;;         ;;;   :description "CEDET is a Collection of Emacs Development Environment Tools written with the end goal of creating an advanced development environment in Emacs."
;;;;         ;;;   :type git
;;;;         ;;;   :url "https://github.com/emacsmirror/cedet.git"
;;;;         ;;;   :build ("touch `find . -name Makefile`" "make")
;;;;         ;;;   :build/windows-nt ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh"
;;;; 	;;; 	     "sed 's/^M$//' tmp.sh  > tmp2.sh"
;;;; 	;;; 	     "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
;;;;         ;;;   :load "common/cedet.el")
;;;; 
;;;;         ;; ( :name cedet
;;;;         ;;   :website "http://cedet.sourceforge.net/"
;;;;         ;;   :description "CEDET is a Collection of Emacs Development Environment Tools written with the end goal of creating an advanced development environment in Emacs."
;;;;         ;;   :type git
;;;;         ;;   :url "https://github.com/emacsmirror/cedet.git"
;;;;         ;;   :build ("touch `find . -name Makefile`" "make")
;;;;         ;;   :build/windows-nt ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh"
;;;; 	;; 	     "sed 's/^M$//' tmp.sh  > tmp2.sh"
;;;; 	;; 	     "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
;;;;         ;;   :load-path ("./common" "speedbar"))
;;;; 
;;;;         ;; (:name slime
;;;;         ;;  :description "Superior Lisp Interaction Mode for Emacs"
;;;;         ;;  :type git
;;;;         ;;  :features slime-autoloads
;;;;         ;;  ;; :info "doc"
;;;;         ;;  :url "https://github.com/nablaone/slime.git"
;;;;         ;;  :load-path ("." "contrib")
;;;;         ;;  :compile (".")
;;;;         ;;  ;; :build ("make -C doc")
;;;;         ;;  ;; :post-init slime-setup
;;;;         ;;  )
;;;;         ))
;;;; 
;;;; (setq my-el-get-packages
;;;;       (append
;;;;        '(workgroups yasnippet)
;;;;        (mapcar 'el-get-source-name el-get-sources)))
;;;; 
;;;; (el-get 'sync my-el-get-packages)


(provide 'init_el-get)
;;; init_el-get.el ends here
