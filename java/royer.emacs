;; ==========================================================================
;; Fenetres
;; ==========================================================================
;; F1  = Se deplacer de fenetre en fenetre
;; F2  = Scinder horizontalement
;; F3  = Scinder verticalement
;; F4  = fermer toutes les fenetres autres que celle active
;; F6  = supprime la fenetre actuelle
;; C-x r w [a-z0-9] = enregistre la configuration actuelle des fenetres
;; C-x r j [a-z0-9] = restaure la configuration des fenetres
;;
;; ==========================================================================
;; Bookmarks
;; ==========================================================================
;; F7  = bookmark-set
;; F8  = bookmark-jump
;; C-x r l = liste des bookmarks
;;
;; ==========================================================================
;; Tags
;; ==========================================================================
;; M-. = aller a la definition du symbol sous le curseur
;; M-* = revenir ou l'on était
;;
;; ==========================================================================
;; Divers
;; ==========================================================================
;; C-p = passer au buffer suivant
;; F5  = compilation
;;
;; F9  = comment-region
;; F10 = uncomment-region
;;
;; F11 = remplacement de chaine dans la region selectionnee
;; F12 = calculatrice
;; C-x a v = cherche et ouvre le fichier dont le nom est sous le curseur
;; 
;; ==========================================================================
;; Mais aussi
;; ==========================================================================
;; M-x dos-unix
;; M-x eshell
;; M-x occur
;; M-x zone
;; M-x artist-mode



;; ==========================================================================
;; Two key bindings are loaded :
;; C-x a f: ltf-find-file
;; C-x a v: ltf-find-file-at-point
;; C-u C-x a v : find file at point, in another window.
;; If anyone finds smartest key binding for these functions, let me know
;; i will add it in this file
;; The purpose of these functions is to allow you to read quickly
;; a file located in some known directories, without specifying its full path
;; Two interactive functions are provided :
;; ltf-find-file : gives you the choice to give a relative file name
;; ltf-find-file-at-point : reads the file name at point
;; these two functions load the file(s) with this name if they appear
;; to exist in one of the absolute pathnames defined in the variable
;; ltf-find-this-file-list
;; ltf-find-only-first is no more used
;; if ltf-find-only-first is set to NOT NIL, the above functions only
;; load the first file they found.
;; To stop loading when the first file is found
;; (setq ltf-find-only-first t)
;; To load all the matching files in ltf-find-this-file-list
;; (setq ltf-find-only-first nil)
;; These portions of code are here to explain and test 
;; To clear ltf-find-this-file-list
;; (makunbound 'ltf-find-this-file-list)
;; to add a path to the ltf-find-this-file-list
;; (setq ltf-find-this-file-list (cons ".." ltf-find-this-file-list ))

(server-start)



















;;Kosovar's touch

;;(defun dos-to-unix ()
;;  "Convert a DOS buffer to Unix format."
;;  (interactive)
;;  (beginning-of-buffer)
;;  (replace-string "\r\n" "\n"))


;;browse des fenetres
(global-set-key [(control tab)] `other-window)
(global-set-key [S-iso-lefttab] 
   '(lambda () (interactive) (other-window -1)))


;;taille des buffers
(global-set-key [C-M-up] 'enlarge-window)
(global-set-key [C-M-down] 'shrink-window)
(global-set-key [C-M-right] 'enlarge-window-horizontally)
(global-set-key [C-M-left] 'shrink-window-horizontally)



(global-set-key [f7] 'hs-hide-block)
(global-set-key [f8] 'hs-show-block)
(global-set-key [(control f7)] 'hs-hide-all)
(global-set-key [(control f8)] 'hs-show-all)



;;automatically close brackets, quotes, etc when typing
;;(defun insert-parentheses () "insert parentheses and go between them" (interactive)
;;(insert "()")
;;(backward-char 1))
;;(defun insert-brackets () "insert brackets and go between them" (interactive)
;;(insert "[]")
;;(backward-char 1))
;;(defun insert-braces () "insert curly braces and go between them" (interactive)
;;(insert "{}")
;;(backward-char 1))
;;(defun insert-quotes () "insert quotes and go between them" (interactive)
;;(insert "\"\"")
;;(backward-char 1))
;;(global-set-key "(" 'insert-parentheses) ;;inserts "()"
;;(global-set-key "[" 'insert-brackets)
;;(global-set-key "{" 'insert-braces)
;;(global-set-key "\"" 'insert-quotes)


;;occur interactif, regexp du mot sous le curseur
(defun call-occur()
(interactive)
(occur (current-word)))
(global-set-key (quote [f1]) 'call-occur) 



;;Completion des chemins
(autoload 'comint-dynamic-complete-filename "comint" "" t)
(global-set-key [(control $)] 'comint-dynamic-complete-filename) 


;;(load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")
;;(setq semantic-load-turn-useful-things-on t)
;;(require 'semantic-load)

;;(setq semanticdb-project-roots
;;(list "~/These/Programme/BeamGL/"))
;;(global-set-key [(control !)] 'semantic-ia-complete-symbol-menu)



;;pour les tags
(setq tags-table-list '("./""~/"))

(global-set-key [(control *)] 'find-tag-other-window)
(global-set-key [(control !)] 'find-function-other-window)


;;(set-background-color "ivory")

















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(global-set-key "\C-xaf" 'ltf-find-file)
(global-set-key "\C-xav" 'ltf-find-file-at-point-interactive)

(defvar ltf-open-in-other-window t
  "Whether or not to open the file in another window (equivalent of giving a prefix arg).")

(defvar ltf-find-this-file-list
  (list "." "/usr/local/share/emacs/21.1/lisp")
  "List of directories to search when using load-this-file.")

;;(defvar ltf-find-only-first t
;;  "Set to t to stop loading of files as soon as one has been found.")

;;;###autoload
(defun ltf-find-file (&optional arg)
  "Loads the file whose relative path is given."
  (interactive "MFile to find (give a relative path): ")
  (ltf-find-file-at-point arg))

;;;###autoload
(defun ltf-find-file-at-point-interactive (&optional prefix arg)
  "Just calls `ltf-find-file-at-point' but accepts prefix argument to open the file in another buffer."
  (interactive "P")
  (ltf-find-file-at-point arg prefix))

;;;###autoload
(defun ltf-find-file-at-point (&optional arg prefix)
  "Loads a file wich relative path is given, searching in ltf-find-this-file-list for paths.
If ARG is nil, loads the relative pathname located at point.
Three kinds of paths are recognized: path/file:line-number: or \"path/file\" or <path/file>.
The first one is useful for grep-like files. You can format your log files this way."
  (interactive)
  (if arg
      (ltf-find-file-in-path arg ltf-find-this-file-list)
    (save-excursion
      (let ((line-end (save-excursion
			(progn
			  (end-of-line)
			  (point)))))
					;		(if (re-search-backward "\\(^[\"<]?\\|[\"< ]\\)" 0 t 1)
	(if (re-search-backward "\\(^\\|[\"<	]\\)" 0 t 1)
	    (progn
	      (let* ((kind-of-sep (match-string 1))
		     (re
		      (cond
		       ((equal kind-of-sep "\"")
			(progn (forward-char 1) 
			       "\\([^\"]+\\)\""))
		       ((equal kind-of-sep "<")
			(progn (forward-char 1)
			       "\\([^>]+\\)>"))
		       ((or (equal kind-of-sep " ")
			    (equal kind-of-sep "")
			    (equal kind-of-sep "	"))
			(progn (re-search-forward "[^	]")
			       (backward-char 1)
			       "\\([^:	]+\\)\\(:\\([0-9]+\\):?\\)?"))
		       (t "\\([^:]+\\)\\(:\\([0-9]+\\):?\\)?"))))
		(if (re-search-forward re line-end t 1)
		    (ltf-find-file-in-path (match-string 1) ltf-find-this-file-list (match-string 3))
		  (message "No matching character for %s with %s" kind-of-sep re))))
	  (message "No beg of line, nor character \" or < found backward."))))))


;; The list of paths is sent to this function to enable in the future
;; the use of other lists of paths
;; This version considers the path is relative or absolute (beginning
;; by /, ./, or ~

;;;###autoload
(defun ltf-find-file-relative-in-path 
  (this-file path-list &optional line-to-reach)
  (if (null path-list)
      nil
    (let ((the-file (expand-file-name (concat (car path-list) 
					      "/"
					      this-file))))
      (if (file-exists-p the-file)
	  the-file
	(ltf-find-file-relative-in-path this-file 
					(cdr path-list)
					line-to-reach)))))
	  
  
;;;###autoload
(defun ltf-find-file-in-path (this-file path-list &optional line-to-reach)
  (let ((absolute-file 
	 (if (and (file-name-absolute-p this-file)
		  (file-exists-p this-file))
	     this-file
	   (ltf-find-file-relative-in-path
	    this-file path-list line-to-reach))))
    (let ((buffer 
	   (if (null absolute-file)
	       (let ((existing-buffer 
		      (get-buffer 
		       (file-name-nondirectory
			this-file))))
		 (if (buffer-live-p existing-buffer)
		     existing-buffer))
	     (find-file-noselect absolute-file))))
      (if (null buffer)
	  (error "Can't find %s in path %s"
		 this-file path-list)
	(if (or prefix ltf-open-in-other-window)
	    (switch-to-buffer-other-window buffer)
	  (switch-to-buffer buffer))
	(if line-to-reach 
	    (goto-line (string-to-number line-to-reach)))))))

;; ==========================================================================

(setq-default comment-coulumn 70)

(if (file-exists-p "/bin/bash")
    (setq explicit-shell-file-name "/bin/bash"))

(fset 'yes-or-no-p 'y-or-n-p)

;;(global-set-key [(f1)]  'man-follow)
(global-set-key [(f3)]  'split-window-horizontally)
(global-set-key [(f2)]  'split-window-vertically)
(global-set-key [(f6)]  'delete-other-windows)
(global-set-key [(f4)]  'delete-window)
(global-set-key [(f5)]  'compile)
(global-set-key [(f5)] '(lambda () (interactive)(compile "make")))
;;(global-set-key [(f7)]  'bookmark-set)
;;(global-set-key [(f8)]  'bookmark-jump)
(global-set-key [(f9)]  'comment-region)
(global-set-key [(f10)] 'uncomment-region)
(global-set-key [(f11)] 'query-region)
(global-set-key [(control return)] 'dabbrev-expand)
(global-set-key [(control home)]   'beginning-of-buffer)
(global-set-key [(control end)]    'end-of-buffer)

(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'tags-search)

(global-set-key "\C-p" 'bury-buffer)

(pc-selection-mode)

(setq scroll-step 1)
(setq scroll-conservatively 1)

(auto-compression-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

(setq auto-mode-alist
      (append '(("\\.inl$"  . c++-mode)
                ("\\.cg$" . c++-mode)
		        ("\\.cc$" . c++-mode)
              ("\\.cpp$" . c++-mode)
              ("\\.hpp$" . c++-mode)
		        ("\\.hh$" . c++-mode)
				("\\.c$"  . c-mode)
				("\\.h$"  . c++-mode)
            ("\\.java$"  . java-mode))
			  auto-mode-alist))

;; ==========================================================================
(defun query-region (from to)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (let ((mark-active nil))
	(goto-char (point-min))
	(call-interactively `query-replace)))))

;;(global-set-key [(f11)] 'query-region)
;; ==========================================================================

(global-set-key [(f6)]  'delete-window)
(global-set-key [(f12)] 'indent-region)

(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'imenu-add-menubar-index)


;; ==========================================================================
(defun dos-unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))


;; ==========================================================================
;;  Mouse wheel
;; ==========================================================================
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [(mouse-4)] 'down-slightly)
(global-set-key [(mouse-5)] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [(shift mouse-4)] 'down-one)
(global-set-key [(shift mouse-5)] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [(control mouse-4)] 'down-a-lot)
(global-set-key [(control mouse-5)] 'up-a-lot)
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(Man-notify-method (quote pushy))
 '(auto-compression-mode t nil (jka-compr))
 '(blink-cursor nil)
 '(c-default-style "ellemtel")
 '(case-fold-search t)
 '(compilation-scroll-output t)
 '(compilation-window-height 12)
 '(current-language-environment "Latin-9")
 '(default-input-method "latin-9-prefix")
 ;;'(ecb-options-version "2.27")
 ;;'(ecb-process-non-semantic-files nil)
 ;;'(ecb-tip-of-the-day nil)
 '(fortran-tab-mode-default nil t)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(menu-bar-mode t)
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t nil (pc-select))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(speedbar-verbosity-level 2)
 '(tab-width 3)
 '(tags-add-tables (quote ask-user) t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(truncate-lines t)
 '(uniquify-buffer-name-style nil nil (uniquify))
 '(visible-bell t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(cursor ((t (:background "DarkOrange"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "darkgreen"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "blue"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "darkRed"))))
 '(font-lock-type-face ((((class color) (background light)) (:underline t)))))


(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)
; ---- language-env DON'T MODIFY THIS LINE!
(if (>= emacs-major-version 21)
    (progn
      (set-language-environment "Latin-9")
      (setq selection-coding-system 'compound-text-with-extensions)
    )
    (if (>= emacs-major-version 20)
        (set-language-environment "Latin-1")
        (require 'iso-syntax)))
;; Names for calendar command.
;; These should be derived from nl_langinfo() by emacs
;;
(defvar calendar-day-name-array
  ["dim" "lun" "mar" "mer" "jeu" "ven" "sam"])
(defvar calendar-month-name-array
  ["janvier" "février" "mars" "avril" "mai" "juin" 
   "juillet" "août" "septembre" "octobre" "novembre" "décembre"])
; ---- language-env end DON'T MODIFY THIS LINE!

(put 'upcase-region 'disabled nil)
