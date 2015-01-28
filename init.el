;;
;; init.el
;;

;; Language
(set-language-environment 'Japanese)

;; code
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;Package Management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marbmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'undo-tree)
(require 'rainbow-delimiters)

(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))

(set-face-attribute 'default nil :family "Ricty" :height 120)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(require 'emms-snetup)
(require 'emms-i18n)
(emms-standard)
;todo: install emacs-window-manager, autocomp
