;;; init_recentf.el --- recentf settings

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

(require 'cl)
(require 'recentf)

;; @see http://www.emacswiki.org/cgi-bin/wiki/download/recentf-ext.el
;; (require 'recentf-ext)

;; recentf cache file path
(setq recentf-save-file (my-dotfile-var "recentf.cache"))

;; ;; @see http://masutaka.net/chalow/2011-10-30-2.html
;; (defvar my-recentf-list-prev nil)

;; ;; 保存時にメッセージの出力を抑止
;; (defadvice recentf-save-list
;;   (around no-message activate)
;;   "If `recentf-list' and previous recentf-list are equal,
;; do nothing. And suppress the output from `message' and
;; `write-file' to minibuffer."
;;   (unless (equal recentf-list my-recentf-list-prev)
;;     (flet ((message (format-string &rest args)
;;                     (eval `(format ,format-string ,@args)))
;;            (write-file (file &optional confirm)
;;                        (let ((str (buffer-string)))
;;                          (with-temp-file file
;;                            (insert str)))))
;;       ad-do-it
;;       (setq my-recentf-list-prev recentf-list))))

;; ;; クリーンアップ時のメッセージ出力を抑止
;; (defadvice recentf-cleanup
;;   (around no-message activate)
;;   "suppress the output from `message' to minibuffer"
;;   (flet ((message (format-string &rest args)
;;                   (eval `(format ,format-string ,@args))))
;;     ad-do-it))

;; stop recentf-cleanup
(setq recentf-auto-cleanup 'never)
;; anything で便利なので履歴の保存量を多少多めにしておく
(setq recentf-max-saved-items 1000)
;; 保存ファイルのの設定に リモートファイル tramp の先等を追加。これを実施すると起動時にパスワード等の確認はされない
(add-to-list 'recentf-keep 'file-remote-p)
(add-to-list 'recentf-keep 'file-readable-p)
;; 除外ファイル
(setq recentf-exclude
      '("\\.elc$"
        "\\.pyc$"
        "\\.cache$"
        ".recentf$"
        "^/var/"
        "^/tmp/"))

;; Emacs 終了時に cleanup
;; (add-hook 'kill-emacs-query-functions 'recentf-cleanup)

;; 30分で自動保存
(defvar my-timer-for-recentf-save-list (run-at-time t (* 30 60) 'recentf-save-list))
(recentf-mode 1)


(provide 'init_recentf)
;;; init_recentf.el ends here
