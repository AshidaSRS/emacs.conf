;;; ace-jump-helm-line-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ace-jump-helm-line" "../../../../../.emacs.d/elpa/ace-jump-helm-line-20160918.1136/ace-jump-helm-line.el"
;;;;;;  "a2b0adbd701c1edadb92faccc0e6f9c7")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ace-jump-helm-line-20160918.1136/ace-jump-helm-line.el

(autoload 'ace-jump-helm-line "ace-jump-helm-line" "\
Jump to a candidate and execute the default action.

\(fn)" t nil)

(autoload 'ace-jump-helm-line-and-select "ace-jump-helm-line" "\
Jump to and select the candidate in helm window.

\(fn)" t nil)

(defalias 'ace-jump-helm-line-execute-action 'ace-jump-helm-line-and-select)

(autoload 'ace-jump-helm-line-idle-exec-add "ace-jump-helm-line" "\


\(fn FUNC)" nil nil)

(autoload 'ace-jump-helm-line-idle-exec-remove "ace-jump-helm-line" "\


\(fn FUNC)" nil nil)

(defvar ace-jump-helm-line-autoshow-mode nil "\
Non-nil if Ace-Jump-Helm-Line-Autoshow mode is enabled.
See the `ace-jump-helm-line-autoshow-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ace-jump-helm-line-autoshow-mode'.")

(custom-autoload 'ace-jump-helm-line-autoshow-mode "ace-jump-helm-line" nil)

(autoload 'ace-jump-helm-line-autoshow-mode "ace-jump-helm-line" "\
Automatically show line labels in `helm'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ace-jump-helm-line-20160918.1136/ace-jump-helm-line-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/ace-jump-helm-line-20160918.1136/ace-jump-helm-line.el")
;;;;;;  (22819 19937 412737 60000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ace-jump-helm-line-autoloads.el ends here
