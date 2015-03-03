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

;;(require 'evil)
;;(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))

(set-face-attribute 'default nil :family "Ricty" :height 120)

;;(require 'powerline-evil)
;;(powerline-evil-vim-color-theme)

(require 'emms-snetup)
(require 'emms-i18n)
(emms-standard)
;todo: install emacs-window-manager, autocomp

(require 'eww)
;;; [http://rubikitch.com/2014/11/19/eww-nocolor/]背景・文字色を無効化する
(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
(defun eww-disable-color ()
  "ewwで文字色を反映させない"
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "ewwで文字色を反映させる"
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))


