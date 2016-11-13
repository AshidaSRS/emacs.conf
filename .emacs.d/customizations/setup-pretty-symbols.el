(global-prettify-symbols-mode +1)

(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ)))

(add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (push '(">=" . ?≥) prettify-symbols-alist)))
