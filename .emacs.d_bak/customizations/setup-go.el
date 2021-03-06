;; GO

;;go get golang.org/x/tools/cmd/oracle
;;go get -u github.com/dougm/goflymake

(require 'go-autocomplete)
(require 'auto-complete-config)

;(setenv "GOPATH" "/home/ashida/.github/Go-things")

;(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
;(load-file "$GOPATH/src/github.com/dougm/goflymake/go-flymake.el")
;(load-file "$GOPATH/src/github.com/dougm/goflymake/go-flycheck.el")

;(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")
;(require 'go-flymake)
;(require 'go-flycheck)

(defun my-go-mode-hook ()
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (if (not (string-match "go" compile-command))
            (set (make-local-variable 'compile-command)
                 "go build -v && go test -v && go vet"))

    (setq tab-width 2 indent-tabs-mode nil)
    (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)



(provide 'go-settings)
