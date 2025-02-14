LINE_COMMENT_STYLES = {
    ABAP     = '*',
    ADA      = '--',
    ASSEMBLY = ';',
    BASIC    = '\'',
    C_LIKE   = '//',
    CLOJURE  = ';',
    ERLANG   = '%%',
    FORTRAN  = '!',
    LISP     = ";;",
    PERL     = '#',
    TEX      = '%',
    VIM      = '"',
}

BLOCK_COMMENT_STYLES = {
    C_LIKE = {'/*', '*/'},
    DELPHI = {'{', '}'},
    HTML   = {'<!--', '-->'},
    LUA    = {'--[' .. '[', ']]--'},
    MATLAB = {'%{', '}%'},
    NIM    = {'#[', ']#'},
    OCAML  = {'(*', '*)'},
    PYTHON = {'"""', '"""'},
    RUBY   = {'=begin', '=end'},
}

COMMENT_FROM_FILE_EXTENSION = {
    abap        = LINE_COMMENT_STYLES.ABAP,
    ada         = LINE_COMMENT_STYLES.ADA,
    applescript = LINE_COMMENT_STYLES.ADA,
    asm         = LINE_COMMENT_STYLES.ASSEMBLY,

    bas = LINE_COMMENT_STYLES.BASIC,

    c      = LINE_COMMENT_STYLES.C_LIKE,
    cpp    = LINE_COMMENT_STYLES.C_LIKE,
    cs     = LINE_COMMENT_STYLES.C_LIKE,
    css    = BLOCK_COMMENT_STYLES.C_LIKE,
    clj    = LINE_COMMENT_STYLES.CLOJURE,
    cljs   = LINE_COMMENT_STYLES.CLOJURE,
    cljr   = LINE_COMMENT_STYLES.CLOJURE,
    cljc   = LINE_COMMENT_STYLES.CLOJURE,
    cljd   = LINE_COMMENT_STYLES.CLOJURE,
    cbl    = LINE_COMMENT_STYLES.ABAP,
    cob    = LINE_COMMENT_STYLES.ABAP,
    cpy    = LINE_COMMENT_STYLES.ABAP,
    carbon = LINE_COMMENT_STYLES.C_LIKE,

    d    = LINE_COMMENT_STYLES.C_LIKE,
    dart = LINE_COMMENT_STYLES.C_LIKE,
    dfm  = BLOCK_COMMENT_STYLES.DELPHI,
    dpr  = BLOCK_COMMENT_STYLES.DELPHI,
    dpk  = BLOCK_COMMENT_STYLES.DELPHI,

    ex  = LINE_COMMENT_STYLES.PERL,
    exs = LINE_COMMENT_STYLES.PERL,
    erl = LINE_COMMENT_STYLES.ERLANG,

    f90     = LINE_COMMENT_STYLES.FORTRAN,
    f       = LINE_COMMENT_STYLES.FORTRAN,
    ["for"] = LINE_COMMENT_STYLES.FORTRAN,

    fs       = LINE_COMMENT_STYLES.C_LIKE,
    fsi      = LINE_COMMENT_STYLES.C_LIKE,
    fsx      = LINE_COMMENT_STYLES.C_LIKE,
    fsscript = LINE_COMMENT_STYLES.C_LIKE,
    fish     = LINE_COMMENT_STYLES.PERL,

    gd       = LINE_COMMENT_STYLES.PERL,
    gdscript = LINE_COMMENT_STYLES.PERL,
    go       = LINE_COMMENT_STYLES.C_LIKE,
    groovy   = LINE_COMMENT_STYLES.C_LIKE,
    gvy      = LINE_COMMENT_STYLES.C_LIKE,
    gy       = LINE_COMMENT_STYLES.C_LIKE,
    gsh      = LINE_COMMENT_STYLES.C_LIKE,

    h    = LINE_COMMENT_STYLES.C_LIKE,
    hpp  = LINE_COMMENT_STYLES.C_LIKE,
    hrl  = LINE_COMMENT_STYLES.ERLANG, -- Erlang file
    hs   = LINE_COMMENT_STYLES.ADA,
    lhs  = LINE_COMMENT_STYLES.ADA,
    html = BLOCK_COMMENT_STYLES.HTML,
    hx   = LINE_COMMENT_STYLES.C_LIKE,
    hxml = LINE_COMMENT_STYLES.C_LIKE,

    java = LINE_COMMENT_STYLES.C_LIKE,
    js   = LINE_COMMENT_STYLES.C_LIKE,
    jl   = LINE_COMMENT_STYLES.PERL,

    kl  = LINE_COMMENT_STYLES.C_LIKE,
    kts = LINE_COMMENT_STYLES.C_LIKE,

    lisp = LINE_COMMENT_STYLES.LISP,
    lua  = LINE_COMMENT_STYLES.ADA,

    m    = LINE_COMMENT_STYLES.TEX,
    mat  = LINE_COMMENT_STYLES.TEX,
    mojo = LINE_COMMENT_STYLES.PERL,
    ml   = BLOCK_COMMENT_STYLES.OCAML,
    mli  = BLOCK_COMMENT_STYLES.OCAML,

    nim = LINE_COMMENT_STYLES.PERL,

    pas = BLOCK_COMMENT_STYLES.OCAML,
    pl  = LINE_COMMENT_STYLES.PERL,
    php = LINE_COMMENT_STYLES.C_LIKE,
    ps1 = LINE_COMMENT_STYLES.PERL,
    py  = LINE_COMMENT_STYLES.PERL,

    r   = LINE_COMMENT_STYLES.PERL,
    rkt = LINE_COMMENT_STYLES.CLOJURE,
    rb  = LINE_COMMENT_STYLES.PERL,
    ru  = LINE_COMMENT_STYLES.PERL,
    rs  = LINE_COMMENT_STYLES.C_LIKE,

    s     = LINE_COMMENT_STYLES.ASSEMBLY,
    sh    = LINE_COMMENT_STYLES.PERL,
    swift = LINE_COMMENT_STYLES.C_LIKE,

    tex  = LINE_COMMENT_STYLES.TEX,
    toml = LINE_COMMENT_STYLES.PERL,
    ts   = LINE_COMMENT_STYLES.C_LIKE,
    tsx  = LINE_COMMENT_STYLES.C_LIKE,

    vim = LINE_COMMENT_STYLES.VIM,

    yml  = LINE_COMMENT_STYLES.PERL,
    yaml = LINE_COMMENT_STYLES.PERL,

    zig = LINE_COMMENT_STYLES.C_LIKE,
}

return {
    COMMENT_FROM_FILE_EXTENSION = COMMENT_FROM_FILE_EXTENSION,
}
