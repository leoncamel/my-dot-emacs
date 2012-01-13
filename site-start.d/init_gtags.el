;;; init_gtags.el --- gtags settings

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

(autoload 'gtags-mode "gtags" "" t)

(add-hook 'c-mode-hook
   '(lambda ()
      (gtags-mode 1)
))

(add-hook 'c++-mode-hook
   '(lambda ()
      (gtags-mode 1)
))

(add-hook 'gtags-mode-hook
          '(lambda ()
             (setq gtags-path-style 'relative)))

;; (setq gtags-suggested-key-mapping t)
(add-hook 'gtags-mode-hook 
  '(lambda()
     (local-set-key (kbd "M-.")   'gtags-find-tag)    ; find a tag, also M-.
     (local-set-key (kbd "M-,")   'gtags-find-rtag)   ; reverse tag
     (local-set-key (kbd "M-@")   'gtags-find-symbol) ; find symbol
     (local-set-key (kbd "M-t p") 'gtags-pop-stack)
     (local-set-key (kbd "M-t ]") 'gtags-find-tag-from-here)
     (local-set-key (kbd "M-t g") 'gtags-find-with-grep)
     (local-set-key (kbd "M-t r") 'gtags-find-rtag)
     (local-set-key (kbd "M-t t") 'gtags-find-tag)
     ;; (local-set-key (kbd "M-t h") 'gtags-display-browser)     
     ;; (local-set-key (kbd "M-t f") 'gtags-find-file)
     ;; (local-set-key (kbd "M-t s") 'gtags-parse-file)
     ;; (local-set-key (kbd "M-t i") 'gtags-find-with-idutils)
     ;; (local-set-key (kbd "M-t v") 'gtags-visit-rootdir)
     ))

;;;;;;;;;;;;;;;;;;;;
;; anything-gtags ;;
;;;;;;;;;;;;;;;;;;;;
(require 'anything-gtags)

(provide 'init_gtags)
;;; init_gtags.el ends here
