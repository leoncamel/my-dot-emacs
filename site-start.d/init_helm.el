;;; init_helm.el --- helm settings

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

;; (add-to-list 'load-path (my-dotfile-vendor "helm.git"))
(require 'helm-config)
(require 'helm-mode)

;; Local keybinding
(define-key helm-command-map (kbd "C-s") 'helm-semantic)
(define-key helm-command-map (kbd "o k") 'helm-org-keywords)
(define-key helm-command-map (kbd "o h") 'helm-org-headlines)
(custom-set-variables
 '(helm-command-prefix-key "C-h"))

;; Global keybinding
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-X") 'helm-M-x)
;; (global-set-key (kbd "C-c g") 'helm-do-grep)
(global-set-key (kbd "C-:") 'helm-semantic)

(require 'helm-semantic)
(helm-attrset 'candidate-number-limit 9999 helm-c-source-semantic)

(provide 'init_helm)
;;; init_helm.el ends here
