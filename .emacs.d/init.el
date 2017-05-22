;; Melpa, Melpa-Stable, masmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;packages to install
(defvar my-packages'(
    use-package
    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    ido-ubiquitous
    smex
    projectile
    tagedit
    magit
    moe-theme
    scss-mode
    yaml-mode
    coffee-mode
    web-mode
    emmet-mode
    smartscan
    ac-cider
    go-mode
    go-autocomplete
    ac-haskell-process
    plantuml-mode
    puml-mode
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(add-to-list 'load-path "~/.emacs.d/extras")

;;;;;;;;;;;;;;;;;;;
;; Tegmacs ;;
;;;;;;;;;;;;;;;;;;;

;; (defun tegmacs-load ()
;;   (add-to-list 'load-path "~/git/tegmacs")
;;   (load-file "~/git/tegmacs/tegmacs.el")
;;   (require 'tegmacs)
;;   (setq tegmacs-message-mark-as-read t))

;; (tegmacs-load)

;;;;;;;;;;;;;;;;;;;
;; Customization ;;
;;;;;;;;;;;;;;;;;;;

;;Directory for diferents conf files
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct environment variables
(load "shell-integration.el")

;; Miscelaneus and functions
(load "misc.el")

;; These customizations are for navigation between buffers, etc.
(load "navigation.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; some user interface elements
(load "ui.el")

;; company conf
(load "setup-company.el")

;; Langauage-specific
(load "setup-scala-mode-auto.el")
;;(load "extras/emacs-scala-mode/scala-mode.el")
(load "setup-elisp.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-haskell.el")
(load "setup-lua.el")
(load "setup-css.el")
(load "setup-ruby.el")
(load "setup-yaml.el")
(load "setup-web.el")
(load "setup-java.el")
(load "setup-go.el")
(load "setup-scala.el")
(load "setup-uml.el")
(load "setup-org.el")
(load "setup-reveal.el")
(load "setup-python.el")
(load "setup-elm.el")
(load "setup-helm.el")
(load "setup-flycheck.el")
(load "setup-color-id.el")
(load "setup-elixir.el")
;;(load "setup-ac.el")
(load "setup-emojify.el")
;;(load "setup-ensime.el")
(load "setup-ciao.el")

;Custom variables
(setq custom-file "~/.emacs.d/customizations/custom.el")
(load custom-file)
