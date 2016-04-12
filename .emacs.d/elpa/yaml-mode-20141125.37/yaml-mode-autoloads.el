;;; yaml-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "yaml-mode" "../../../../../../AppData/Roaming/.emacs.d/elpa/yaml-mode-20141125.37/yaml-mode.el"
;;;;;;  "6b64e13db4c17b599c9900d53bcc5ee8")
;;; Generated autoloads from ../../../../../../AppData/Roaming/.emacs.d/elpa/yaml-mode-20141125.37/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;;***

;;;### (autoloads nil nil ("../../../../../../AppData/Roaming/.emacs.d/elpa/yaml-mode-20141125.37/yaml-mode-autoloads.el"
;;;;;;  "../../../../../../AppData/Roaming/.emacs.d/elpa/yaml-mode-20141125.37/yaml-mode.el")
;;;;;;  (21834 33335 411000 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; yaml-mode-autoloads.el ends here
