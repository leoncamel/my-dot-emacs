;;; my-fullscreen.el --- fullscreen functions

;; Copyright (C) 2011  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: tools

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

;; Full screen toggle
;; (defun toggle-fullscreen ()
;;   (interactive)
;;   (cond (ns-p (if (fboundp 'ns-toggle-fullscreen)
;;                   (funcall 'ns-toggle-fullscreen)))
;;         (t ((set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
;;                                                      nil
;;                                                      'fullboth))))))
(defun toggle-fullscreen-wmctrl ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

(defun toggle-fullscreen-xwin ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(defun toggle-fullscreen-linux (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (cond (ns-p (if (fboundp 'ns-toggle-fullscreen)
                  (funcall 'ns-toggle-fullscreen)))
        (t (if (fboundp 'toggle-fullscreen-linux)
               (funcall 'toggle-fullscreen-linux))))
  )


(provide 'my-fullscreen)
;;; my-fullscreen.el ends here
