;;; my-package-plus.el --- Download and backup packages.

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

(require 'package)

(defun package-backup-download (one-pkg)
  "Download a package and save it into backup directory."
  (let* ((kind (package-desc-kind (cdr (assq one-pkg package-archive-contents)))))
    (cond ((eq kind 'tar)
           (message (concat (symbol-name one-pkg) " is tar")))
          ((eq kind 'single)
            (message (concat (symbol-name one-pkg) " is single")))
          ((t
             (message (concat (symbol-name one-pkg) " package unknown")))))))

(provide 'my-package-plus)
;;; my-package-plus.el ends here
