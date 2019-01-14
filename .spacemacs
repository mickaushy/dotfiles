;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup          t
                      auto-completion-enable-help-tooltip               t ;; or 'manual (C-h)
                      auto-completion-enable-sort-by-usage              t
                      auto-completion-return-key-behavior               'complete
                      auto-completion-tab-key-behavior                  'cycle
                      auto-completion-complete-with-key-sequence        nil
                      auto-completion-complete-with-key-sequence-delay  0.1
                      auto-completion-idle-delay 0.2
                      auto-completion-private-snippets-directory        nil)
     ;; better-defaults
     c-c++
     colors
     command-log
     coq
     csv
     emacs-lisp
     git
     github
     (haskell :variables haskell-enable-hindent-style "intero")
     (japanese :variables
               migemo-dictionary  "/usr/local/Cellar/cmigemo/HEAD-5c014a8/share/migemo/utf-8")
     (latex :variables latex-build-command "LaTeX")
     markdown
     neotree
     org
     python
     (rust :variables rust-format-on-save t)
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/bash"
            shell-enable-smart-eshell t
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     ;; spell-checking
     syntax-checking
     table-manipulation
     themes-megapack
     theming
     twitter
     ranger
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;; mixed-pitch
                                      ob-async
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 7)
                                (projects . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         material-light
                         alect-light-alt
                         spacemacs-light
                         ;; flatui
                         ;; apropospriate-light
                         ;; dichromacy
                         ;; solarized-light
                         ;; solarized-dark
                         ;; leuven
                         ;; whiteboard
                         ;; twilight-bright
                         ;; tao-yang
                         ;; tango
                         ;; occidental
                         ;; colorsarenice-light
                         ;; adwaita
                         ;; default
                         ;; monokai
                         ;; zenburn
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs
                                  :separator arrow
                                  :separator-scale 1.1)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Sarasa Term J"
                                  :size 14
                                  :weight normal
                                  :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc …
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%b(%m)"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; locale -------------
  (setenv  "LANG"      "en_US.UTF-8")
  (setenv  "LC_ALL"    "en_US.UTF-8")
  (setenv  "LC_CTYPE"  "en_US.UTF-8")
  (setq system-time-locale "C")

  ;; https://github.com/syl20bnr/spacemacs/issues/10796
  (define-derived-mode anaconda-view-mode special-mode "Anaconda-View")

  (setq initial-frame-alist '((width . 192) (height . 48)))

  ;; --------------------
  ;; font
  ;; --------------------

  ;; http://misohena.jp/blog/2017-09-26-symbol-font-settings-for-emacs25.html
  (setq use-default-font-for-symbols nil)

  ;; https://www.shimmy1996.com/en/posts/2018-06-24-fun-with-fonts-in-emacs/

  ;; (defun my/create-fontset (fontset1 latinfont cjkfont)
  ;;   (set-fontset-font fontset1 'latin
  ;;                     (font-spec :family latinfont) nil 'append)
  ;;   (dolist (charset '(kana han cjk-misc hangul kanbun bopomofo))
  ;;     (set-fontset-font fontset1 charset
  ;;                       (font-spec :family cjkfont) nil 'prepend))
  ;;   )

  ;; (defvar serif_proportional
  ;;   (create-fontset-from-fontset-spec standard-fontset-spec)
  ;;   "Standard fontset for user.")
  ;; (my/create-fontset serif-proportional "merriweather" "Noto Serif CJK JP")

  ;; (defvar sans_proportional
  ;;   (create-fontset-from-fontset-spec standard-fontset-spec)
  ;;   "Standard fontset for user.")
  ;; (my/create-fontset sans-proportional "rubik" "Hiragino Maru Gothic ProN")

  ;; serif proportional
  ;; -*-merriweather-normal-normal-normal-*-*-*-*-*-p-0-fontset-serif_proportional
  ;; (create-fontset-from-ascii-font
  ;;  "merriweather:weight=normal:slant=normal" nil "serif_proportional")
  ;; fallback
  ;; (create-fontset-from-fontset-spec
  ;;  "-*-Arial Unicode MS-normal-normal-normal-*-*-*-*-*-m-*-fontset-serif_proportional")
  ;; ;; (set-fontset-font "fontset-serif_proportional" 'unicode
  ;; ;;                   (font-spec :family "Noto Serif CJK JP") nil 'append)
  ;; (dolist (charset '(kana han cjk-misc hangul kanbun bopomofo))
  ;;   (set-fontset-font "fontset-serif_proportional" charset
  ;;                     (font-spec :family "Noto Serif CJK JP") nil 'append))
  ;; (set-fontset-font "fontset-serif_proportional" 'latin
  ;;                   (font-spec :family "merriweather") nil 'append)

  ;; sans proportional
  ;; (create-fontset-from-ascii-font
  ;;  "rubik:weight=normal:slant=normal" nil "sans_proportional")
  ;; (create-fontset-from-fontset-spec
  ;;  "-*-Arial Unicode MS-normal-normal-normal-*-*-*-*-*-m-*-fontset-sans_proportional")
  ;; ;; (set-fontset-font "fontset-sans_proportional" 'unicode
  ;; ;;                   (font-spec :family "Hiragino Maru Gothic ProN") nil 'append)
  ;; (dolist (charset '(kana han cjk-misc hangul kanbun bopomofo))
  ;;   (set-fontset-font "fontset-sans_proportional" charset
  ;;                     (font-spec :family "Hiragino Maru Gothic ProN") nil 'append))
  ;; (set-fontset-font "fontset-sans_proportional" 'latin
  ;;                   (font-spec :family "Rubik") nil 'append)

  ;; monospace
  ;; (create-fontset-from-ascii-font
  ;;  "sarasa term j:size=14:weight=normal:slant=normal" nil "monospace")

  ;; (set-fontset-font
  ;;  "fontset-monospace" 'unicode (font-spec :family "Sarasa Term J") nil 'prepend)

  ;; greek:vollkorn,
  (create-fontset-from-fontset-spec
   "-*-noto serif cjk j-medium-r-normal-*-*-*-*-*-p-*-fontset-serif_proportional,
   latin:merriweather:width=regular,
   cyrillic:vollkorn,
   han:noto serif cjk j,
   kana:noto serif cjk j,
   hangul:noto serif cjk kr,
   bopomofo:noto serif cjk tc"
   )

  ;; greek:sarasa ui j,
  (create-fontset-from-fontset-spec
   "-*-sarasa ui j-regular-r-normal-*-*-*-*-*-p-*-fontset-sans_proportional,
   latin:rubik:weight=medium,
   cyrillic:rubik:weight=medium,
   han:sarasa ui j,
   kana:sarasa ui j,
   bopomofo:sarasa ui tc"
   )

  ;; greek:sarasa term j,
  (create-fontset-from-fontset-spec
   "-*-sarasa term j-regular-r-normal-*-*-*-*-*-m-*-fontset-monospace,
   latin:sarasa term j,
   cyrillic:sarasa term j,
   kana:sarasa term j,
   han:sarasa term j,
   bopomofo:sarasa term tc"
   )

  ;; var/fixed pitch
  (set-face-attribute 'variable-pitch nil :font "fontset-serif_proportional" :fontset "fontset-serif_proportional")
  (set-face-attribute 'fixed-pitch nil :font "fontset-monospace" :fontset "fontset-monospace")

  ;; theming
  ;; nth theme in theming-mods. there is only one of theme to be mod'ed, so 0.
  (setq mytheme0-faces '(
                         (variable-pitch :fontset "fontset-serif_proportional" :font "fontset-serif_proportional")
                         (fixed-pitch    :fontset "fontset-sans_proportional" :font "fontset-monospace")
                         (linum          :inherit fixed-pitch :background "#FAFAFA")
                         ;; org-mode
                         (org-default    :inherit variable-pitch)
                         (org-indent     :inherit (fixed-pitch org-hide)) ;; important
                         (org-meta-line  :inherit (fixed-pitch font-lock-comment-face))
                         (org-code       :inherit fixed-pitch :foreground "grey33")
                         (org-verbatim   :inherit fixed-pitch :foreground "grey47")
                         (org-ellipsis   :inherit variable-pitch :underline nil)
                         (org-block-begin-line    :inherit fixed-pitch :box nil :background "#FAFAFA")
                         (org-block-end-line      :inherit fixed-pitch :box nil :background "#FAFAFA")
                         (org-latex-and-related   :inherit org-formula)
                         (org-sexp-date  :inherit (fixed-pitch org-latex-and-related))
                         ;; company-mode
                         ;; (company-preview-search)               ; inherit company-tooltip-common-sellection
                         ;; (company-tooltip-annotation-selection) ; inherit company-tooltip-selection
                         ;; (company-tooltip-common)               ; inherit company-tooltip
                         ;; (company-tooltip-common-selection)     ; inherit company-tooltip-selection
                         ;; (company-tooltip-mouse)                ; inherit highlight
                         ;; (company-tooltip-search)               ; inherit highlight
                         ;; (company-tooltip-search-selection)     ; inherit highlight
                         ))

  (message (format "value for %s is %s."
                   'spacemacs--theming-header-faces
                   spacemacs--theming-header-faces))
  (dolist (org-level-x '(org-level-1 org-level-2 org-level-3 org-level-4
                         org-level-5 org-level-6 org-level-7 org-level-8))
    (add-to-list 'mytheme0-faces
                 (list org-level-x :fontset '"fontset-sans_proportional"
                                   :font '"fontset-sans_proportional"
                                   :box nil)))

  (dolist (fixed-faces '(;; org-mode
                          org-kbd
                          org-date
                          org-todo
                          org-done
                          org-footnote
                          org-formula
                          org-link
                          org-block
                          org-checkbox
                          org-table
                          org-ellipsis
                          ;; company-mode
                          company-echo
                          company-echo-common
                          company-preview
                          company-preview-common
                          company-scrollbar-bg
                          company-scrollbar-fg
                          company-template-field
                          company-tooltip
                          company-tooltip-annotation
                          company-tooltip-selection))
    (add-to-list 'mytheme0-faces
                 (list fixed-faces :inherit 'fixed-pitch) t)) ;; t to append

  (add-to-list 'mytheme0-faces 'material-light)

  (setq theming-modifications
        (list mytheme0-faces))

  ;; (setq theming-modifications
  ;;       '((material-light ;; 0th theme. cdr of this:'mytheme0-faces
  ;;          (variable-pitch :fontset "fontset-serif_proportional" :font "fontset-serif_proportional")
  ;;          (fixed-pitch    :fontset "fontset-sans_proportional" :font "fontset-monospace")
  ;;          (linum          :inherit fixed-pitch :background "#FAFAFA")
  ;;          ;; org-mode
  ;;          (org-default    :inherit variable-pitch)
  ;;          ;; (org-level-1    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-2    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-3    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-4    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-5    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-6    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-7    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          ;; (org-level-8    :fontset "fontset-sans_proportional" :font "fontset-sans_proportional" :box nil)
  ;;          (org-indent     :inherit (fixed-pitch org-hide)) ;; important
  ;;          (org-meta-line  :inherit (fixed-pitch font-lock-comment-face))
  ;;          (org-code       :inherit fixed-pitch :foreground "grey33")
  ;;          (org-verbatim   :inherit fixed-pitch :foreground "grey47")
  ;;          ;; (org-kbd        :inherit fixed-pitch)
  ;;          ;; (org-date       :inherit fixed-pitch)
  ;;          ;; (org-todo       :inherit fixed-pitch)
  ;;          ;; (org-done       :inherit fixed-pitch)
  ;;          ;; (org-footnote   :inherit fixed-pitch)
  ;;          ;; (org-formula    :inherit fixed-pitch)
  ;;          ;; (org-link       :inherit fixed-pitch)
  ;;          ;; (org-block      :inherit fixed-pitch)
  ;;          ;; (org-checkbox   :inherit fixed-pitch)
  ;;          ;; (org-table      :inherit fixed-pitch)
  ;;          (org-ellipsis   :inherit variable-pitch :underline nil)
  ;;          (org-block-begin-line    :inherit fixed-pitch :box nil :background "#FAFAFA")
  ;;          (org-block-end-line      :inherit fixed-pitch :box nil :background "#FAFAFA")
  ;;          (org-latex-and-related   :inherit org-formula)
  ;;          (org-sexp-date  :inherit (fixed-pitch org-latex-and-related))
  ;;          ;; ;; company
  ;;          ;; (company-echo :inherit fixed-pitch)
  ;;          ;; (company-echo-common :inherit fixed-pitch)
  ;;          ;; (company-preview :inherit fixed-pitch)
  ;;          ;; (company-preview-common :inherit fixed-pitch)
  ;;          ;; ;; (company-preview-search)               ; inherit company-tooltip-common-sellection
  ;;          ;; (company-scrollbar-bg :inherit fixed-pitch)
  ;;          ;; (company-scrollbar-fg :inherit fixed-pitch)
  ;;          ;; (company-template-field :inherit fixed-pitch)
  ;;          ;; (company-tooltip :inherit fixed-pitch)
  ;;          ;; (company-tooltip-annotation :inherit fixed-pitch)
  ;;          ;; ;; (company-tooltip-annotation-selection) ; inherit company-tooltip-selection
  ;;          ;; ;; (company-tooltip-common)               ; inherit company-tooltip
  ;;          ;; ;; (company-tooltip-common-selection)     ; inherit company-tooltip-selection
  ;;          ;; ;; (company-tooltip-mouse)                ; inherit highlight
  ;;          ;; ;; (company-tooltip-search)               ; inherit highlight
  ;;          ;; ;; (company-tooltip-search-selection)     ; inherit highlight
  ;;          ;; (company-tooltip-selection :inherit fixed-pitch)
  ;;          ;; (company-preview-search)               ; inherit company-tooltip-common-sellection
  ;;          ;; (company-tooltip-annotation-selection) ; inherit company-tooltip-selection
  ;;          ;; (company-tooltip-common)               ; inherit company-tooltip
  ;;          ;; (company-tooltip-common-selection)     ; inherit company-tooltip-selection
  ;;          ;; (company-tooltip-mouse)                ; inherit highlight
  ;;          ;; (company-tooltip-search)               ; inherit highlight
  ;;          ;; (company-tooltip-search-selection)     ; inherit highlight
  ;;          )
  ;;         ))

  ;; nth theme in theming-mods. there is only one of theme to be mod'ed, so 0.
  ;; (setq mytheme0-faces (cdr (nth 0 theming-modifications)))


  ;; fontset
  (setq face-font-rescale-alist
        '(
          (".*Noto Serif CJK.*" . 1.0)
          (".*Rubik.*" . 1.0)
          (".*Vollkorn.*" . 1.09)
          ;; (".*mononoki.*" . 0.92)
          (".*merriweeather.*" . 0.90)
          (".*Hiragino Sans.*" . 1.0)
          (".*sarasa ui.*" . 1.0)
          (".*STIX.*" . 0.96)
          ("-cdac$" . 1.3)
          ))
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; --------------------
  ;; general settings
  ;; --------------------

  ;; mixed-pitch -> var
  (add-hook 'text-mode-hook 'variable-pitch-mode)

  ;; powerline & backslash issue on macOS JIS keyboard
  (if (eq system-type 'darwin)
      (progn
        ;; (setq ns-use-srgb-colorspace nil) ; issues/4226
        (setq powerline-image-apple-rgb t) ; milkypostman/powerline/issues/54
        (define-key evil-insert-state-map (kbd "M-¥") [92])
        (define-key evil-ex-search-keymap (kbd "M-¥") [92])
        (define-key evil-ex-completion-map (kbd "M-¥") [92])
        )
    )

  (setq-default evil-escape-delay 0.3)

  ;; --------------------
  ;; org layer
  ;; --------------------
  (with-eval-after-load 'org
   ;; main setting
   (setq org-agenda-files '("/Users/mickaushy/Dropbox/org"))
   (setq org-directory "/Users/mickaushy/Dropbox/org")
   (setq org-default-notes-file (concat org-directory "TODO.org"))
   ;; (setq org-export-allow-bind-keywords t)

   ;; org-appearance
   (setq
    org-ellipsis                        "    ⟫"
    org-bullets-bullet-list             '("❏" "❏" "⦂" "⦂" "⦂" "⦂" "⦂" "⦂")
    ;; ⦂✑☞➩⬭⏢⧖◻⬜⬦⟡✰❖❏⁂✱✲⁑✢✽＊§⎔︙፨》❱❯⟫◿
    org-pretty-entities                 t
    org-hidden-keywords                 '(title email)
    org-hide-emphasis-markers           t
    org-hide-macro-markers              t
    org-highlight-latex-and-related     '(latex) ; latex script entities
    org-fontify-whole-heading-line      t
    org-fontify-done-headline           nil
    org-fontify-quote-and-verse-blocks  t
    )

   ;; org-agenda
   (setq org-agenda-time-grid
         '((daily today require-timed)
           (500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300)
           "......"
           "----------------"
           ))

   ;; org-link: pdf option
   (setq org-file-apps
         '((auto-mode . emacs)
           ("\\.pdf\\'" . "zathura \"%s\"")
           ("\\.pdf::\\([0-9]+\\)\\'" . "zathura \"%s\" --page=%1")))

   ;; org-export(luatex-ja)
   (setq org-export-latex-default-packages-alist
         '(("" luatexja nil)
           ("" "graphicx" nil)
           ("" "hyperref" nil)))

   (setq org-latex-create-formula-image-program 'imagemagick)

   (setq org-latex-to-pdf-process
         '("/usr/texbin/lualatex %b"))

   ;; org-babel ---------
   (org-babel-do-load-languages
    'org-babel-load-languages
    '(
      (C       . t) ;; c++ included
      (coq     . t)
      (gnuplot . t)
      (haskell . t)
      (latex   . t)
      (org     . t)
      (python  . t)
      (R       . t)
      (shell   . t)
      ))

   (require 'ob-async)
   (setq ob-async-no-async-languages-alist '("ipython"))

   ;; org-download
   (setq org-download-method 'directory
         org-download-image-dir "~/Dropbox/org/doc/media")

   (add-hook 'text-mode-hook
             (lambda ()
               (push '(" x " . ?×) prettify-symbols-alist)))

   ;; (add-hook 'org-mode-hook 'variable-pitch-mode)
   )

  ;; --------------------
  ;; japanese layer
  ;; --------------------
  (eval-after-load "migemo"
    (setq migemo-dictionary "/usr/local/Cellar/cmigemo/HEAD-5c014a8/share/migemo/utf-8"))
  (with-eval-after-load "helm"
    (helm-migemo-mode 1))
  (require 'avy-migemo-e.g.ivy)
  (setq pangu-spacing-real-insert-separtor nil)
  (global-pangu-spacing-mode nil) ;; disable autospace ascii & unicode
  ;; also exclude´‘’‚“”„«»‹›†‡‡　・．〔〕［］｛｝〈〉《》『』【】＜＞×＝≠∞°′″℃｟｠〘〙〖〗µ
  ;; source: https://github.com/coldnew/pangu-spacing/blob/master/pangu-spacing.el
  ;; (setq latin-and-separator
  ;;       "、。，！？；：「」（）´‘’‚“”„«»‹›†‡‡　・．〔〕［］｛｝〈〉《》『』【】＜＞×＝≠∞°′″℃｟｠〘〙〖〗")
  (setq pangu-spacing-chinese-before-english-regexp-exclude
        (rx (group-n 1 (or (in "、。，！？；：「」（）´‘’‚“”„«»‹›†‡‡　・．〔〕［］｛｝〈〉《》『』【】＜＞×＝≠∞°′″℃｟｠〘〙〖〗")))
            (group-n 2 (in "a-zA-Z0-9"))))
  (setq pangu-spacing-chinese-after-english-regexp-exclude
        (rx (group-n 1 (in "a-zA-Z0-9"))
            (group-n 2 (or (in "、。，！？；：「」（）´‘’‚“”„«»‹›†‡‡　・．〔〕［］｛｝〈〉《》『』【】＜＞×＝≠∞°′″℃｟｠〘〙〖〗")))))

  ;; skk settings -------
  ;; these need to be written here; otherwise written in ~/.skk
  (setq skk-byte-compile-init-file t)
  (setq default-input-method "japanese-skk")
  ;; migemo を使うから skk-isearch にはおとなしくしていて欲しい
  (setq skk-isearch-start-mode 'latin)
  ;; disable kana in normal-state
  ;; https://github.com/zarudama/dotfiles/blob/master/emacs/mikio/mikio-evil.el
  (when (locate-library "skk")
    (require 'skk)
    (defun my-skk-latin-in-normal-state ()
      (when skk-mode (skk-latin-mode 1)))
    (add-hook 'evil-normal-state-entry-hook 'my-skk-latin-in-normal-state))

  ;; --------------------
  ;; auto-completion layer
  ;; --------------------
  (global-company-mode t)
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

  ;; --------------------
  ;; personal keybindings
  ;; --------------------
  (spacemacs/declare-prefix "o" "my-cmd.")
  (spacemacs/set-leader-keys "oj" 'skk-mode)
  (spacemacs/set-leader-keys "oT"
    'spacemacs/table-manipulation-transient-state/body)
  ;; (spacemacs/set-leader-keys "oc" 'count-words-region) -> SPC x c there is
  ;; you can also write like: (spacemacs/set-leader-keys "f" '("foo" . long-name-for-command-foo))
  ;; in that case, you need extra switch to tern on
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-migemo-function-names
   (quote
    ((ivy--regex :around ivy--regex-migemo-around)
     (ivy--regex-ignore-order :around ivy--regex-ignore-order-migemo-around)
     (ivy--regex-plus :around ivy--regex-plus-migemo-around)
     ivy--highlight-default-migemo ivy-occur-revert-buffer-migemo ivy-occur-press-migemo avy-migemo-goto-char avy-migemo-goto-char-2 avy-migemo-goto-char-in-line avy-migemo-goto-char-timer avy-migemo-goto-subword-1 avy-migemo-goto-word-1 avy-migemo-isearch avy-migemo-org-goto-heading-timer avy-migemo--overlay-at avy-migemo--overlay-at-full)))
 '(package-selected-packages
   (quote
    (mixed-pitch ob-async company-auctex auctex company-quickhelp pangu-spacing japanese-holidays evil-tutor-ja ddskk cdb ccc avy-migemo migemo zen-and-art-theme pug-mode company-ghc zenburn-theme yasnippet-snippets yapfify xterm-color ws-butler winum white-sand-theme which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twittering-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme realgud ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme proof-general professional-theme popwin planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el password-generator paradox overseer orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme nameless mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme intero insert-shebang inkpot-theme indent-guide importmagic impatient-mode hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate google-c-style golden-ratio gnuplot github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist ghc gh-md gandalf-theme fuzzy font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flycheck-bashate flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump dracula-theme django-theme disaster diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dante dakrone-theme cython-mode cyberpunk-theme csv-mode counsel-projectile company-web company-statistics company-shell company-rtags company-ghci company-coq company-cabal company-c-headers company-anaconda command-log-mode column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode cmm-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme centered-cursor-mode cargo busybee-theme bubbleberry-theme browse-at-remote birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))))
