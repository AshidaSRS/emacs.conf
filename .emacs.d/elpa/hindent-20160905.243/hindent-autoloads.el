;;; hindent-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "hindent" "../../../../../.emacs.d/elpa/hindent-20160905.243/hindent.el"
;;;;;;  "91b61f562d38e6e66773d59852152eb2")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/hindent-20160905.243/hindent.el

(autoload 'hindent-mode "hindent" "\
Indent code with the hindent program.

Provide the following keybindings:

\\{hindent-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'hindent-reformat-decl "hindent" "\
Re-format the current declaration.

The declaration is parsed and pretty printed.  Comments are
preserved, although placement may be funky.

\(fn)" t nil)

(autoload 'hindent-reformat-buffer "hindent" "\
Reformat the whole buffer.

\(fn)" t nil)

(autoload 'hindent-reformat-decl-or-fill "hindent" "\
Re-format current declaration, or fill paragraph.

Fill paragraph if in a comment, otherwise reformat the current
declaration.  When filling, the prefix argument JUSTIFY will
cause the text to be justified, as per `fill-paragraph'.

\(fn JUSTIFY)" t nil)

(autoload 'hindent-reformat-region "hindent" "\
Reformat the region from BEG to END, accounting for indentation.

If DROP-NEWLINE is non-nil, don't require a newline at the end of
the file.

\(fn BEG END &optional DROP-NEWLINE)" t nil)

(define-obsolete-function-alias 'hindent/reformat-decl 'hindent-reformat-decl)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/hindent-20160905.243/hindent-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/hindent-20160905.243/hindent.el")
;;;;;;  (22819 19912 476068 861000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hindent-autoloads.el ends here
