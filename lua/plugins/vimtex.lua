return{ -- vimtex, plugin to compile the "*.tex" file
    'lervag/vimtex',

    ft = "tex", -- lazy-loaded on filetype "*.tex"

    config = function ()
        vim.opt.conceallevel = 1    -- 0:不隐藏   1：特殊字符替换隐藏字符  2：隐藏字符完全隐藏  3：完全不显示隐藏字符
        vim.cmd([[
            let g:tex_flavor='latex'

            let g:vimtex_compiler_latexmk_engines = {
                \ '_'                : '-xelatex',
            \}

            "----------------跳转设置----------------------------
            if has('win32') || (has('unix') && exists('$WSLENV'))
                if executable('sioyek.exe')
                    let g:vimtex_view_method = 'sioyek'
                    let g:vimtex_view_sioyek_exe = 'sioyek.exe'
                    let g:vimtex_callback_progpath = 'wsl nvim'
                elseif executable('mupdf.exe')
                    let g:vimtex_view_general_viewer = 'mupdf.exe'
                elseif executable('SumatraPDF.exe')
                    let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
                endif
            endif

            let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
            let g:vimtex_compiler_progname = 'nvr'	" 这一行默认就是这个值，但如果编译出现问题，可以手动指定试一试。
            let g:tex_conceal='adbmg'
            let g:vimtex_quickfix_mode=0	"不自动弹出报错窗口
        ]])
    end
}
