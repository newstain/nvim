local opt = vim.opt

-- 行号
-- opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true   -- 自动缩进
opt.smartindent = true
opt.cindent = true  -- C 语言缩进
opt.expandtab = true    -- 空格替代 tab 

-- 自动换行
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 文本格式
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"

-- jkhl 移动光标时保留 8 行
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "90"  -- 代码过长提示，右侧出现一条竖线

-- 外部程序修改时，自动加载
opt.autoread = true
