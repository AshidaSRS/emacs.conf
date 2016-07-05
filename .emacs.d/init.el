;; Melpa, Melpa-Stable, masmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
    ;; allow ido usage in as many contexts as possible.
    ;; customizations/navigation.el line 23 
    ido-ubiquitous
    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    smex
    ;; project navigation
    projectile
    rainbow-delimiters
    ;; edit html tags like sexps
    tagedit
    ;; git integration
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

(defun tegmacs-load ()
  (add-to-list 'load-path "~/.github/tegmacs")
  (load-file "~/.github/tegmacs/tegmacs.el")
  (require 'tegmacs)
  (setq tegmacs-message-mark-as-read t))

(tegmacs-load)

;;;;;;;;;;;;;;;;;;;
;; Customization ;;
;;;;;;;;;;;;;;;;;;;

;;Directory for diferents conf files
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct environment variables
(load "shell-integration.el")

;; These customizations are for navigation between buffers, etc.
(load "navigation.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; some user interface elements
(load "ui.el")

;; Langauage-specific
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
(load "uml-steup.el")
(load "org-setup.el")
(load "setup-reveal.el")
