;;; my-struct-parser.el --- my c/c++ struct parser utility

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


;; TODO:
;;  1. require "semantic" pacakge system
;;  2. arrow
;;  3. semanticdb support? arrow?
;;  4. union

(require 'semantic)
;; (require 'semantic/tag)

;; templates for formating struct to string
(defconst yyc/dot-file-head "digraph %s {
    node [shape=record fontsize=12 fontname=Courier style=filled];
    edge[color=blue];
    rankdir=LR;


"
  "Header part of dot file")

(defconst yyc/dot-file-tail "

}"
  "Tail part of dot file")

(defconst yyc/dot-head "subgraph cluster_%s {
    node [shape=record fontsize=12 fontname=Courier style=filled];
    color = lightgray;
    style=filled;
    label = \"Struct %s\";
    edge[color=\"#2e3436\"];"
  "Header part of dot file.")
(defconst yyc/dot-tail "
}"
  "Tail part of dot")
(defconst yyc/dot-node-head
  "
        node_%s[shape=record label=\"<f0>*** STRUCT %s ***|\\\n"
  "Format of node.")
(defconst yyc/dot-node-tail "
\"];"
  "Format of node.")

(defun my-struct-member-format (assoc-elem)
  ""
  (let* ((elem (cdr assoc-elem))
         (idx  (car assoc-elem))
         (elem-type (semantic-tag-type elem))
         (elem-name (semantic-tag-name elem)))
    (format "<f%d>%s %s\\l|\\"
            idx
            (if (semantic-tag-p elem-type)
                (format "%s %s"
                 (semantic-tag-type elem-type)
                 (semantic-tag-name elem-type))
              elem-type)
            elem-name)
   ))

(defun my-struct-format (elem)
  ""
  (concat
   (format yyc/dot-head
           (semantic-tag-name elem)
           (semantic-tag-name elem)
           (semantic-tag-name elem))
   (format yyc/dot-node-head
           (semantic-tag-name elem)
           (semantic-tag-name elem))
   (mapconcat 'my-struct-member-format
              (loop for idx from 2
                    for elem in (semantic-tag-type-members elem)
                    collect (cons idx elem))
              "\n")
   (format yyc/dot-node-tail)
   (format yyc/dot-tail)))

(defun my-region-test (start end)
  "my-region-test"
  (interactive "rp")
  (let ((parsed-results (semantic-parse-region start end)))
    (set-buffer (get-buffer-create "tmp.dot"))
    (graphviz-dot-mode)
    (erase-buffer)
    (goto-char (point-max))
    
    ;; (insert (prin1-to-string parsed-results))
    ;; (insert "\n--------------------------------\n")
    ;; (insert (prin1-to-string (semantic-tag parse-result :members)))
    (insert (format yyc/dot-file-head "USBxx"))
    (insert
     (mapconcat 'my-struct-format
                (remove-if-not 'my-struct-filter parsed-results)
                "\n\n\n"))
    (insert (format yyc/dot-file-tail))
    ;; (insert "Hello, world")
    (setq my-parse-result parsed-results)
    ))

(defun my-struct-filter (elem)
  "filter all structs"
  (let ((elem-type (semantic-tag-type elem)))
    (and elem-type
         (stringp elem-type)
         (string= "struct" elem-type))))

(provide 'my-struct-parser)
;;; my-struct-parser.el ends here
