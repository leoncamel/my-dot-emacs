;;; slsi177.ips.waseda.ac.jp.el --- slsi177

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

(require 'init_setenv)

;; executable path priority in *reverse* order
(setq my-exec-path
      (reverse
       '(
         ;; High Priority ;;
         "~/bin/"
         ;;
         "~/bin/global-6.1/bin"
         ;; Low Priority ;;
         )))

(dolist (p my-exec-path)
  (prepend-exec-path p))

(provide 'slsi177.ips.waseda.ac.jp)
;;; slsi177.ips.waseda.ac.jp.el ends here
