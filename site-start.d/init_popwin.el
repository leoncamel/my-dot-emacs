;;; init_popwin.el --- popwin settings

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

(require 'popwin)
(defvar popwin:special-display-config-backup popwin:special-display-config)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.4)
(setq anything-samewindow nil)
(setq popwin:special-display-config
      (append '(
                ("*anything buffers*" :height 20)
                ("*Compile-Log*" :height 10 :noselect t)
                (dired-mode :position top)
                ;; ("*terminal<1>*")
                ;; ("*Remember*" :stick t)
                ;; ("*Org Agenda*")
                ("*Backtrace*")
                ("*sdic*" :noselect)
                ("*aHg diff*" :position top :height 50)
                ("\\*hg command" :regexp t :noselect)
                ("\\*magit: [a-zA-Z0-9_]+" :regexp t :height 20)
                ("*Occur*" :height 20)
                ("*Moccur*" :height 20)
                ("*quickrun*" :height 20)
                ("*workroups help*" :height 20)
                )
               popwin:special-display-config))

;; (define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
(define-key dired-mode-map "o" #'(lambda ()
                                   (interactive)
                                   (popwin:find-file (dired-get-file-for-visit))))
;; (key-chord-define-global "mn" 'popwin:messages)


(provide 'init_popwin)
;;; init_popwin.el ends here
