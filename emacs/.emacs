;; ------------
;; Sri's config
;; ------------

(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq initial-scratch-message "")

;; Don't load old .elc files when the .el file is newer
(setq load-prefer-newer t)
(setq inhibit-startup-screen t)
(setq user-full-name "Srivathsan Murali"
      user-mail-address "sri@vathsan.com")

; package archives
(require 'package)
(setq package-enable-at-startup nil
      package-archives
      '(("melpa"           . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/"))
      package-user-dir "~/.emacs.d/elpa/")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (setq evil-vsplit-window-right t))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(use-package helm
  :ensure t
  :config
  (helm-mode t))

(use-package neotree
  :ensure t
  :after evil
  :config

    (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(use-package projectile
  :ensure t
  :defer 5
  :config
  (projectile-mode t))

;; themes
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(use-package monokai-theme
  :disabled
  :ensure t
  :config
  (load-theme 'monokai t))

(use-package hemisu-theme
  :disabled
  :ensure t
  :config
  (load-theme 'hemisu-dark t))

(use-package habamax-theme
  :disabled
  :ensure t
  :config
  (setq habamax-theme-variable-heading-heights nil)
  (load-theme 'habamax t))

;; ---------
;; languages
;; ---------

;; elixir
(use-package elixir-mode
  :mode "\\.ex\\'")

(use-package alchemist
  :ensure t
  :config
  (alchemist-mode t)
  (setq alchemist-mix-command "/home/sri/.asdf/shims/mix"))

;; ---------
;; Interface
;; ---------
;; backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backupsk

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; answer with y or n
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)

;; show coloumn number
(column-number-mode t)

;; Don't beep at me
(setq visible-bell t)


