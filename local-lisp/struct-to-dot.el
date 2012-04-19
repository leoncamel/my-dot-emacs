;;; struct-to-dot.el --- parse c/c++ struct to graphviz-dot graph

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

;; Function used to add fields of struct into a dot file (for Graphviz).

;;;;; Dot templates

(defconst yc/dot-head "subgraph cluster_%s {
    node [shape=record fontsize=12 fontname=Courier style=filled];
    color = lightgray;
    style=filled;
    label = \"%s %s\";
    edge[color=\"brown\"];"
  "Header part of dot file.")
(defconst yc/dot-tail "
}"
  "Tail part of dot")
(defconst yc/dot-node-head
  "node_%s[shape=record
            label=\"{<f0>*** %s %s ***|\\"
  "Format of node.")
(defconst yc/dot-node-tail "
}\"];"
  "Format of node.")

(defconst attr-str "
<f%d>%s : %s\\l|\\" "nil")

(defconst attr-func "
%s() : %s\\l\\" "nil")

(defconst u-dot-node-head
  "node_%s[shape=record
            label=\"{<f0> %s |<f1>\\"
  "Format of node.")
(defconst u_attr-str "
%s : %s\\l\\" "nil")

(defconst u_attr-func "
%s() : %s\\l\\" "nil")

;;;;; Regular expressions to match a field of a struct.

(defconst r-attr-str
  (rx bow
      (group (zero-or-one (+ (or "<" ">"  "*" alnum "_" blank))))
      (one-or-more blank)
      (group (+?  ascii)) ";")
  "Regular expression for matching struct fields.")

(defconst r-name
  (rx (zero-or-one "typedef") (zero-or-more blank)
      (group (or "class" "struct")) (zero-or-more blank)
      (zero-or-one (group (+? (or alnum "_" )))) (zero-or-more blank)
      (zero-or-one ":" (+? (or alnum "_" blank)))
      (zero-or-more "
") (zero-or-more blank) "{"
(1+ anything) "}" (zero-or-more blank)
(zero-or-one (group (zero-or-more not-newline)) ";")
)
"Regular expression for mating struct name")

(defconst r-match_semicol
  (rx (+? anything) ";"))

(defconst r-match_attr
  (rx (+? (not (any "(" ")" "{" "}"))) ";"))

(defconst r-match_func
  (rx (zero-or-more blank)
      (zero-or-one (group (+? (or "<" ">"  "*" alnum "_" blank))))
      (one-or-more blank) (? "(*")
      (group (+? (or alnum "~" "_"))) (? ")")
      (zero-or-more blank) "(" (*? anything) ")" (* blank)
      (group (? "=" (* blank) "0")) (* blank)";"))

(defconst r-match_tag
  (rx (zero-or-more blank) (zero-or-one "typedef" (one-or-more  blank))
      (or "struct" "class") (zero-or-more (or alnum "_" ":" blank))
      (zero-or-one "
") (zero-or-more blank) "{" ))

(defconst r-match_public
  (rx bol (* blank) (group (or "public" "private" "protected"))
      (* blank) ":")
  "Judge public/private/protected")

(defconst r-match_brack
  (rx bow (group (+? ascii)) "[" (+? not-newline) "]")
  "Regular expression to detect a brack.")

(defconst r-c_comment
  (rx "/*" (*? anything) "*/")
  "Regular expression to match comment of C style.")
(defconst r-cpp_comment
  (rx "//" (*? not-newline) line-end)
  "Regular expression to match comment of C style.")

(defconst type-to-sign '(("public" . "+") ("private" . "-") ("protected" . "#")))
(defun get_sign(x)
  (let ((result (cdr (assoc x type-to-sign))))
    (if result
        result
      "+")))
(defconst r-match_special
  (rx (or alnum blank) (group (or "<" ">"))))

(defun make-regular-string (str)
  "Replace some spectial string: < or >"
  (let ((pos 0)
        (ret-str nil))
    (defun n-iter(str pos)
      (if (string-match r-match_special str pos)
          (progn
            (setq ret-str (concat ret-str
                                  (substring str pos (1- (match-end 1)))
                                  "\\" (match-string 1 str)))
            (setq pos (match-end 1))
            (n-iter str pos))
        (setq ret-str (concat ret-str (substring str pos)))
        )
      )
    (n-iter str pos)
    ret-str))

(defun clean_c_comment (a)
  "Function to remove all comments, both C style and C++ style."
  (let ((all-clean nil)
        (result nil)
        (tmp 0))

    (while (not all-clean)
      (setq result
            (if (string-match r-c_comment a)
                (progn
                  (cons (match-beginning 0)
                        (match-end 0)))
              nil))
      (if result
          (progn
            (setq tmp (car result))
            (while (< tmp (cdr result))
              (aset a tmp ? )
              (setq tmp (1+ tmp))))
        (setq all-clean t)))

    (setq all-clean nil)
    (setq result nil)

    (while (not all-clean)
      (setq result (if (string-match r-cpp_comment a)
                  (progn
                    (cons (match-beginning 0)
                          (match-end 0)))
                nil))
      (if result
          (progn
            (setq tmp (car result))
            (while (< tmp (cdr result))
              (aset a tmp ? )
              (setq tmp (1+ tmp))))
          (setq all-clean t)
        )))
  (replace-regexp-in-string " +" " " a))

(defun yc/cons (one two)
  "Lasy function to make a cons based on a and b."
  (cons (make-regular-string one) (make-regular-string two)))

(defun get_struct_tag (decleration)
  "Abstract decleration from a string"
  (if (string-match r-name decleration 0)
      (progn
        (cons (match-string 1 decleration)
              (if (and (match-string 3 decleration)
                       (> (length (match-string 3 decleration)) 0))
                    (match-string 3 decleration)
                (if (match-string 2 decleration)
                      (match-string 2 decleration)
                  "nil"))))
    '("struct" . "nil")))

(defun skip(msg x)
  (let ((nmsg nil))
    (if x
        (setq nmsg (format "Skip invalid syntax for function: %s." msg))
      (setq nmsg (format "Skip invalid syntax for struct field: %s." msg))
      )
    (message nmsg)))


(defun yc/region-parse (start end)
  "Parse a region, abstract tag and field information."
  (let* ((var-name "")
         (var-type "")
         (pos-end 0)
         (var-defination (buffer-substring-no-properties start end))
         (item_str "")
         (tmp-item nil)
         (attr-list nil)
         (func-list nil)
         (tag-info nil)
         (type_p "+")) ;; + for public, - for private,  # for protected.
    (defun iter (pos)
      (if (string-match r-match_tag var-defination pos) ;; Declerad a struct
          (progn
            (setq pos-end (match-end 0))
            (setq tag-info (get_struct_tag var-defination))
            (iter (1+ pos-end)))
        (progn
          (if (string-match r-match_semicol var-defination pos)
              (progn
                (setq pos-end (match-end 0))
                (setq item_str (substring var-defination pos pos-end))
                (if (string-match r-match_public item_str 0)
                    (progn
                      (setq type_p (get_sign (match-string 1 item_str)))
                      (setq item_str (substring item_str
                                                (+ (match-end 1) 2)))))
                (if (string-match r-match_func item_str 0) ;; Function
                    (progn
                      (setq var-type
                            (if (match-string 1 item_str)
                                (match-string 1 item_str)
                              " "))
                      (setq var-name
                            (concat type_p
                             (match-string 2 item_str)))
                      (if (not  (string= "" (match-string 3 item_str)))
                          (setq var-type (concat "pure " var-type )))
                      (add-to-list 'func-list (yc/cons var-type var-name)))
                  (progn ;; Attributes
                    (if (equal (string-match r-match_attr item_str 0) 0)
                        (progn
                          (if (string-match r-attr-str item_str 0)
                              (progn
                                (setq var-type
                                      (match-string 1 item_str))
                                (setq var-name
                                      (match-string 2 item_str))
                                (if (string-match r-match_brack var-name 0)
                                    (setq var-name
                                          (concat (match-string 1 var-name)
                                                  "[]")))
                                (setq var-name
                                      (concat type_p
                                              (match-string 2 item_str)))
                                (add-to-list 'attr-list
                                             (yc/cons var-type var-name)))
                            (progn
                              (skip item_str nil)))
                          )
                      (progn
                        (skip item_str nil)))
                          ))
                (iter pos-end))))))
    (save-excursion
      (setq var-defination (clean_c_comment var-defination))
      (iter 0))
    (message "Finished, node copied to killing-ring.")
    (list tag-info attr-list func-list)))

(defun yc/struct-to-dot (start end)
  "Generate a detailed dot graph, with one variables or functions perline.
   This is not a UML, it constrate on the contents as well as relationship
  between objects."
  (interactive "rp")
  (let ((parsed-results (yc/region-parse start end))
        (tmp-list nil)
        (tmp-item nil)
        (item-iter 0)
        (counter 0)
        )
    (if (not parsed-results)
        (error "ERROR: Failed to parse selected region"))
    (set-buffer (get-buffer-create "tmp.dot"))
    (graphviz-dot-mode)
    (erase-buffer)
    (goto-char (point-max))

    ;; Tag info.
    (setq tmp-list (nth 0 parsed-results))
    (insert (format yc/dot-node-head
                    (cdr tmp-list)
                    (car tmp-list)
                    (cdr tmp-list)))

    ;; Attributes.
    (setq tmp-list (nth 1 parsed-results))
    (setq item-iter (1- (length tmp-list)))
    (while (>= item-iter 0)
      (setq counter (+ counter 1))
      (setq tmp-item (nth item-iter tmp-list))
      (insert (format attr-str  counter
                      (cdr tmp-item)
                      (car tmp-item)))
      (setq item-iter (1- item-iter)))

    ;; Function list
    (setq tmp-list (nth 2 parsed-results))
    (if tmp-list
        (progn
          (setq item-iter (1- (length tmp-list)))
          (while (>= item-iter 0)
            (setq counter (+ counter 1))
            (setq tmp-item (nth item-iter tmp-list))
            (insert (format attr-func
                            (cdr tmp-item)
                            (car tmp-item)))
            (setq item-iter (1- item-iter)))
          (insert "
|\\"))
      )

    (goto-char (point-max))
    (delete-char -1)
    (insert "<f999>\\" yc/dot-node-tail)
    (if (one-window-p)
        (split-window-vertically))
    (switch-to-buffer-other-window "tmp.dot")
    (kill-ring-save (point-min) (point-max))
    (goto-char (point-min))
    )
  (message "Finished, node copied to killing-ring."))


(defun yc/struct-to-UML (start end)
  "Generated a UML-like dot graph, with all variables in one line, and all
  functions in one line.

Note: This UML is not exactly correct: there's no way to distinguish
  Public/Private/Protected fields of Classes. It's better to use cogre from
  CEDET to generate UML for Classes. BTW, cogre CEDET from internal Emacs,
  don't know why."

  (interactive "rp")
  (let ((parsed-results (yc/region-parse start end))
        (tmp-list nil)
        (tmp-item nil)
        (item-iter 0))
    (if (not parsed-results)
        (error "ERROR: Failed to parse selected region"))
    (set-buffer (get-buffer-create "tmp.dot"))
    (graphviz-dot-mode)
    (erase-buffer)
    (goto-char (point-max))

    ;; Tag info.
    (setq tmp-list (nth 0 parsed-results))
    (insert (format u-dot-node-head
                    (cdr tmp-list)
                    (cdr tmp-list)))

    ;; Attributes.
    (setq tmp-list (nth 1 parsed-results))
    (setq item-iter (1- (length tmp-list)))
    (while (>= item-iter 0)
      (setq tmp-item (nth item-iter tmp-list))
      (insert (format u_attr-str
                      (cdr tmp-item)
                      (car tmp-item)))
      (setq item-iter (1- item-iter)))
    (insert "
|<f2>\\")

    ;; Function list
    (setq tmp-list (nth 2 parsed-results))
    (if tmp-list
        (progn
          (setq item-iter (1- (length tmp-list)))
          (while (>= item-iter 0)
            (setq tmp-item (nth item-iter tmp-list))
            (insert (format u_attr-func
                            (cdr tmp-item)
                            (car tmp-item)))
            (setq item-iter (1- item-iter)))))

    (goto-char (point-max))
    (delete-char -1)
    (insert "\\" yc/dot-node-tail)
    (if (one-window-p)
        (split-window-vertically))
    (switch-to-buffer-other-window "tmp.dot")
    (kill-ring-save (point-min) (point-max))
    (goto-char (point-min))
    )
  (message "Finished, node copied to killing-ring."))

(provide 'struct-to-dot)
;;; struct-to-dot.el ends here

