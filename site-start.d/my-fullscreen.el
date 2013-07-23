;;; my-fullscreen.el --- fullscreen functions

;; Copyright (C) 2011,2012  Le0n Zh4ng

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

;;
;; win32 max/restore frame, copied from:
;; [1] : https://bitbucket.org/phromo/w32-fullscreen/src/tip/w32-fullscreen.el
;;
(defun w32-fullscreen-maximize-frame ()
  "Maximize the current frame (windows only)"
  (interactive)
  (w32-send-sys-command 61488))

(defun w32-fullscreen-restore-frame ()
  "Restore a minimized/maximized frame (windows only)"
  (interactive)
  (w32-send-sys-command 61728))

;; 
(defun w32-toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
;;
(defun toggle-fullscreen-w32-fullscreen-exe ()
  (interactive)
  (shell-command "emacs_fullscreen.exe"))

;;
;; toggle-fullscreen
;;
(defun toggle-fullscreen (&optional f)
  (interactive)
  (cond (ns-p (if (fboundp 'ns-toggle-fullscreen)
                  (funcall 'ns-toggle-fullscreen)))
        (t (if (fboundp 'toggle-fullscreen-linux)
               (funcall 'toggle-fullscreen-linux)))))

;;
;; toggle frame transparency
;;

;; This code snippet download from :
;;   [1] http://www.emacswiki.org/emacs/TransparentEmacs
;; But, it can not work on Emacs-24.
;;  TODO:
;;  1. Does it work on emacs 23?
;;  2. When did the "set-frame-parameter" change parameter from tuple
;;       to single value?

;; (eval-when-compile (require 'cl))
;; (defun toggle-transparency ()
;;   (interactive)
;;   (if (/=
;;        (cadr (frame-parameter nil 'alpha))
;;        100)
;;       (set-frame-parameter nil 'alpha '(100 100))
;;     (set-frame-parameter nil 'alpha '(85 50))))

;;
;; This function, which is modified by myself, can work on Emacs 24.
;;
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (not (eq (frame-parameter nil 'alpha) 100))
      (set-frame-parameter nil 'alpha 100)
    (set-frame-parameter nil 'alpha 85)))

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(provide 'my-fullscreen)
;;; my-fullscreen.el ends here
