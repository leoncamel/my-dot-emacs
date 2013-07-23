;;; init_dotnet.el --- dotnet related modes

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

;; csharp
(require 'csharp-mode)
(defun my-csharp-mode-hook ()
  "Hook function for initialize csharp-mode."
  (require 'yasnippet)
  (yas/minor-mode-on)
  (c-set-style "bsd"))

(add-hook 'csharp-mode-hook 'my-csharp-mode-hook t)

;; fsharp
;; (add-to-list 'load-path (my-dotfile-vendor "fsharp-mode.git"))
;; (setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
;; (autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
;; (autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

;; Use melpa's fsharp-mode package
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp-mode" "Major mode for editing F# code." t)
;; (autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

;; 
(setq inferior-fsharp-program "Fsi.exe")
(setq fsharp-compiler "Fsc.exe")

;; quote command. Especially for windows path with *white space*
(setq fsharp-compile-command (shell-quote-argument (executable-find "fsc")))
(setq fsharp-build-command (shell-quote-argument (executable-find "msbuild")))

;; TODO: move to better place
;; Thrift mode
(add-to-list 'load-path (my-dotfile-vendor "thrift-mode"))
(require 'thrift-mode)

(provide 'init_dotnet)
;;; init_dotnet.el ends here










