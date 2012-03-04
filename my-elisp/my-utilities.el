;;; my-utilities.el --- my small utilities

;; Copyright (C) 2012  Le0n Zh4ng

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

(defvar leon-sublime-executable-path "~/bin/subl"
  "Executable path of Sublime executable.
   MacOSX : ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl ~/bin/subl
  ")
  
(defun leon-open-buffer-in-sublimetext ()
  ""
  (interactive)
  (shell-command
   (concat (expand-file-name leon-sublime-executable-path) " " (buffer-name))))

(provide 'my-utilities)
;;; my-utilities.el ends here
