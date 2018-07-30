;; ------------
;; Sri's config
;; ------------

; package archives
(require 'package)
(setq package-list '(
		     evil
		     evil-leader
		     helm
		     hemisu-theme
		    ))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

; evil mode
(require 'evil)
(evil-mode t)
(setq evil-vsplit-window-right t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")


(require 'helm)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package neotree
  :ensure t
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

;; ---------
;; languages
;; ---------

;; elixir
(require 'elixir-mode)
(elixir-mode)

;; ---------
;; Interface
;; ---------

;; remove the splash screen
(setq inhibit-splash-screen t)

;; Remove the menu bar
(customize-set-variable 'menu-bar-mode nil)

;; theme
(load-theme 'hemisu-light t)
;; (load-theme 'spacemacs-light t)
;; (load-theme 'dracula t)

(setq-default indent-tabs-mode nil)

(defun four-spaces ()
  "inserts four spaces"
  (interactive);
  (insert "    "))

(global-set-key (kdb "<tab>") 'four-spaces)

;; backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backupsk
