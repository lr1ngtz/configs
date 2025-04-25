(setq scroll-margin 5)
;; indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; enable c-x c-l to downcase selected region
(put 'downcase-region 'disabled nil)
;; enable c-x c-u to upcase selected region
(put 'upcase-region 'disabled nil)
;; don't show the splash screen
(setq inhibit-startup-message t)
(menu-bar-mode -1)
;; makes sure the contents of the buffer is refreshed automatically when the file is changed outside of emacs
(global-auto-revert-mode t)
;; select scope
(global-set-key (kbd "C-c s") 'mark-sexp)
(global-set-key (kbd "C-x ;") 'comment-line)

;;; load gruvbox-theme
(require 'gruvbox-theme)

;; ensure emacs can find executables installed by homebrew on intel macs
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; comment/uncomment this line to enable melpa stable if desired.  see `package-archive-priorities`
;; and `package-pinned-packages`. most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;; load lisp
;; custom lisp directory to load path
(add-to-list 'load-path(expand-file-name "~/.emacs.d/lisp"))

;; odin syntax highlighting
(load "odin-mode")

;; display line numbers in every buffer
(global-display-line-numbers-mode)

;; create backup directory if it doesn't exist
(make-directory "~/.emacs.d/backup" t)
;; use a better backup naming scheme
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backup"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups
;; transform file names
(setq backup-transform-file-name-function
      (lambda (filename)
        (concat "~/.emacs.d/backup/"
                (file-name-nondirectory filename))))

;; enable pbcopy
(require 'pbcopy)
(turn-on-pbcopy) ; integrate with system clipboard
(setq select-enable-clipboard t)

;;; enable vertico, consult, orderless, and marginalia
(vertico-mode 1)
(marginalia-mode 1)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

;; config  project.el to ignore __pycache__
(setq project-vc-ignores '("*/__pycache__/*"))

(global-set-key (kbd "M-g g") 'consult-goto-line)
(global-set-key (kbd "C-c f") 'consult-fd)
(global-set-key (kbd "C-c r") 'consult-ripgrep)

;;; git-gutter
(require 'git-gutter)
(global-git-gutter-mode t)
(custom-set-variables
 `(git-gutter:update-interval 2)
 `(git-gutter:modified-sign "==")
 `(git-gutter:added-sign "++")
 `(git-gutter:deleted-sign "--"))

(global-set-key (kbd "C-c g h") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)

;;; vc-diff
(global-set-key (kbd "C-c d") 'vc-diff)
