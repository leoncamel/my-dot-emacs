
   My clean and extensible *.emacs.d* configurations.

# Features

* Three emacs package management systems: [ELPA](http://tromey.com/elpa/), [el-get](https://github.com/dimitri/el-get) and [auto-install](http://www.emacswiki.org/AutoInstall)
* Clean directory structure.
* Modulize emacs elisp configs. 
    
## Directory tree structure

~~~
.
├── README.md
├── TODO.md
├── bin
├── etc
│   └── my-yasnippets
├── init.el
├── private
│   └── init_evernote.el
├── site-start.d
│   └── init_*.el
├── elpa                         ;; ELPA packages
├── el-get                       ;; el-get package system
├── lisp                         ;; auto-install package system
│   └── auto-install.el
├── local-lisp                   ;; modified elisp
├── my-elisp                     ;; my elisp scripts
├── hostconfigs
│   └── $(hostname).el
├── userconfigs
│   └── $(username).el
├── var
│   ├── abbrev_defs
│   ├── ac-comphist.dat
│   ├── auto-save-list
│   ├── backups
│   ├── emacs
│   ├── places
│   └── smex-items
└── vendor
    ├── auto-complete
    ├── color-theme
    └── japanese-holidays
~~~

# Prequisite

## Haskell-mode and ghc-mod

    1. cabal install ghc-mod
    2. cabal install hlint

    3. (optional) cabal install [scion](https://github.com/nominolo/scion)

## Twittering-mode

    1. brew install curl gnutls openssl

    
