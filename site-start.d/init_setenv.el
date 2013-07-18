;;; init_setenv.el --- sentenv

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

(defun prepend-exec-path (dir)
  "prepend a path to exec-path, $PATH, and eshell-path-env"
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (let ((full-dir (expand-file-name dir)))
      (setenv "PATH" (concat full-dir path-separator (getenv "PATH")))
      (setq eshell-path-env (getenv "PATH"))
      (setq exec-path (append (list full-dir) exec-path)))))

;; TODO: Not tested
;; (dolist (dir (list
;;                (expand-file-name "~/bin")
;;                (expand-file-name "~/local/bin")
;;                (expand-file-name "~/.emacs.d/bin")
;;                "/home/leon/bin/emacs-git//bin"
;;                "/usr/local/cuda/bin"
;;                "/usr/lib/lightdm/lightdm"
;;                "/usr/local/sbin"
;;                "/usr/local/bin"
;;                "/usr/sbin"
;;                "/usr/bin"
;;                "/sbin"
;;                "/bin"
;;                "/usr/games"
;;                ))
;;   (prepend-exec-path dir))

;; (setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))

;; (setenv "JAVA_OPTS" "-Dfile.encoding=UTF-8")

;; (setenv "CVS_RSH" "ssh")
;; (setenv "DISPLAY" "localhost")
;; (setenv "SSH_AUTH_SOCK" (getenv "SSH_AUTH_SOCK"))
;; (setenv "LC_ALL" "ja_JP.UTF-8")


;; switch network environment
(defun switch-net-env (env)
  "setup environment variables"
  (interactive "Input env : {waseda,home}")
  (cond ((string= env "waseda")
         (setenv "http_proxy"  "http://133.9.49.250:8080/")
         (setenv "https_proxy" "http://133.9.49.250:8080/")
         (setenv "ftp_proxy"   "http://133.9.49.250:8080/")
         (setenv "no_proxy"     "localhost,127.0.0.0/8,*.local,192.168.0.0/16,133.9.42.0/24")
         (setenv "GIT_PROXY_COMMAND" "git-proxy.sh")
         (message "Waseda Environment setup OK"))
        ((string= env "home")
         (setenv "http_proxy"  nil)
         (setenv "https_proxy" nil)
         (setenv "ftp_proxy"   nil)
         (setenv "no_proxy"    nil)
         (setenv "GIT_PROXY_COMMAND" nil)
         (message "Home Environment setup OK"))
        ((t
          (message "Warning: invalid input"))))
  )

;;
;; load environment for MacOSX
;;   copied from : https://github.com/jwiegley/dot-emacs/blob/master/emacs.el
(defun load-mac-environment-plist ()
  "Load environment variables for MacOSX from "
  (interactive)
  
  ;;;_ , Read system environment
  (let ((plist (expand-file-name "~/.MacOSX/environment.plist")))
    (when (file-readable-p plist)
      (let ((dict (cdr (assq #'dict (cdar (xml-parse-file plist))))))
        (while dict
          (if (and (listp (car dict))
                   (eq 'key (caar dict)))
              (setenv (car (cddr (car dict)))
                      (car (cddr (car (cddr dict))))))
          (setq dict (cdr dict))))

      ;; Configure exec-path based on the new PATH
      (setq exec-path nil)
      (mapc #'(lambda (path)
                (add-to-list 'exec-path path))
            (nreverse (split-string (getenv "PATH") ":"))))))

(provide 'init_setenv)
;;; init_setenv.el ends here
