return {
  -- 如果你想让 neo-tree 的文件操作与 LSP 协同工作（更新导入等），可以使用这个插件：
  -- https://github.com/antosha417/nvim-lsp-file-operations:
  -- {
  --   "antosha417/nvim-lsp-file-operations",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neo-tree/neo-tree.nvim",
  --   },
  --   config = function()
  --     require("lsp-file-operations").setup()
  --   end,
  -- },
  
  {
    "nvim-neo-tree/neo-tree.nvim", -- neo-tree 插件主体
    branch = "v3.x", -- 使用 v3.x 分支
    dependencies = {
      "nvim-lua/plenary.nvim", -- 必需依赖：Lua 工具库
      "nvim-tree/nvim-web-devicons", -- 推荐依赖：文件图标支持
      "MunifTanjim/nui.nvim", -- 必需依赖：UI 组件库
      -- {"3rd/image.nvim", opts = {}}, -- 可选：预览窗口中的图片支持
      {
        "s1n7ax/nvim-window-picker", -- 窗口选择器，用于 open_with_window_picker 快捷键
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false, -- 不包括当前窗口
              autoselect_one = true, -- 只有一个窗口时自动选择
              -- 使用缓冲区选项过滤
              bo = {
                -- 如果文件类型是以下之一，窗口将被忽略
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- 如果缓冲区类型是以下之一，窗口将被忽略
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    lazy = false, -- 不延迟加载
    config = function()
      -- 如果你想要诊断错误的图标，需要在某处定义它们
      -- 在 Neovim v0.10+ 中，你可以在 vim.diagnostic.config() 中配置它们：
      --
      -- vim.diagnostic.config({
      --   signs = {
      --     text = {
      --       [vim.diagnostic.severity.ERROR] = '',
      --       [vim.diagnostic.severity.WARN] = '',
      --       [vim.diagnostic.severity.INFO] = '',
      --       [vim.diagnostic.severity.HINT] = '󰌵',
      --     },
      --   }
      -- })
      --
      -- 在较旧的版本中，你可以手动定义符号：
      -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      -- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      -- 设置快捷键：<leader>e 打开并定位到当前文件(聚焦)
      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
      vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>")

      require("neo-tree").setup({
        -- 基础设置
        close_if_last_window = true, -- if enotree is the last window, close it
        popup_border_style = "NC", -- 弹出窗口边框样式，或使用 "" 在 Neovim v0.11+ 中使用 'winborder'
        enable_git_status = true, -- 启用 Git 状态显示
        enable_diagnostics = true, -- 启用诊断信息显示
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- 打开文件时，不使用包含这些文件类型或缓冲区类型的窗口
        open_files_using_relative_paths = false, -- 使用绝对路径打开文件
        sort_case_insensitive = false, -- 排序时不忽略大小写
        sort_function = nil, -- 使用自定义函数排序文件和目录
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- 这个示例按降序排列文件和目录
        
        -- 默认组件配置
        default_component_configs = {
          container = {
            enable_character_fade = true, -- 启用字符渐变效果
          },
          -- 缩进配置
          indent = {
            indent_size = 2, -- 缩进大小
            padding = 1, -- 左侧额外填充
            -- 缩进指导线
            with_markers = true, -- 显示缩进标记
            indent_marker = "│", -- 缩进标记符号
            last_indent_marker = "└", -- 最后一个缩进标记符号
            highlight = "NeoTreeIndentMarker", -- 缩进标记高亮组
            -- 展开器配置，嵌套文件需要
            with_expanders = nil, -- 如果为 nil 且启用了文件嵌套，将启用展开器
            expander_collapsed = "", -- 折叠状态的展开器图标
            expander_expanded = "", -- 展开状态的展开器图标
            expander_highlight = "NeoTreeExpander", -- 展开器高亮组
          },
          -- 图标配置
          icon = {
            folder_closed = "", -- 关闭文件夹图标
            folder_open = "", -- 打开文件夹图标
            folder_empty = "", -- 空文件夹图标
            -- 默认图标提供者，如果可用会使用 nvim-web-devicons
            provider = function(icon, node, state)
              if node.type == "file" or node.type == "terminal" then
                local success, web_devicons = pcall(require, "nvim-web-devicons")
                local name = node.type == "terminal" and "terminal" or node.name
                if success then
                  local devicon, hl = web_devicons.get_icon(name)
                  icon.text = devicon or icon.text
                  icon.highlight = hl or icon.highlight
                end
              end
            end,
            -- 下面两个设置只是备用，如果你使用 nvim-web-devicons 并在那里配置默认图标
            -- 那么这些永远不会被使用
            default = "*", -- 默认图标
            highlight = "NeoTreeFileIcon", -- 文件图标高亮组
          },
          -- 修改状态配置
          modified = {
            symbol = "[+]", -- 修改状态符号
            highlight = "NeoTreeModified", -- 修改状态高亮组
          },
          -- 名称配置
          name = {
            trailing_slash = false, -- 目录名称不显示尾随斜杠
            use_git_status_colors = true, -- 使用 Git 状态颜色
            highlight = "NeoTreeFileName", -- 文件名高亮组
          },
          -- Git 状态配置
          git_status = {
            symbols = {
              added = "A", -- 新增文件符号
              modified = "M", -- 修改文件符号
              deleted = "D", -- 删除文件符号(只能在 git_status 源中使用)
              renamed = "R", -- 重命名文件符号(只能在 git_status 源中使用)
              -- 状态类型
              untracked = "U", -- 未跟踪文件符号
              ignored = "I", -- 忽略文件符号
              unstaged = "W", -- 未暂存文件符号 (Working directory)
              staged = "S", -- 已暂存文件符号 (Staged)
              conflict = "C", -- 冲突文件符号
            },
          },
          -- 如果你不想使用这些列，可以为每个列单独设置 `enabled = false`
          -- 文件大小列
          file_size = {
            enabled = true, -- 启用文件大小显示
            width = 12, -- 列宽度
            required_width = 64, -- 显示此列所需的最小窗口宽度
          },
          -- 文件类型列
          type = {
            enabled = true, -- 启用文件类型显示
            width = 10, -- 列宽度
            required_width = 122, -- 显示此列所需的最小窗口宽度
          },
          -- 最后修改时间列
          last_modified = {
            enabled = true, -- 启用最后修改时间显示
            width = 20, -- 列宽度
            required_width = 88, -- 显示此列所需的最小窗口宽度
          },
          -- 创建时间列
          created = {
            enabled = true, -- 启用创建时间显示
            width = 20, -- 列宽度
            required_width = 110, -- 显示此列所需的最小窗口宽度
          },
          -- 符号链接目标列
          symlink_target = {
            enabled = false, -- 禁用符号链接目标显示
          },
        },
        
        -- 全局自定义命令列表，每个函数代表一个全局自定义命令
        -- 这些命令将在所有源中可用（除非在 `opts[source_name].commands` 中被覆盖）
        -- 参见 `:h neo-tree-custom-commands-global`
        commands = {},
        
        -- 窗口配置
        window = {
          position = "left", -- 窗口位置：left, right, top, bottom, float, current
          width = 40, -- 窗口宽度
          mapping_options = {
            noremap = true, -- 非递归映射
            nowait = true, -- 不等待
          },
          -- 按键映射
          mappings = {
            ["<space>"] = {
              "toggle_node", -- 切换节点展开/折叠
              nowait = false, -- 如果你有以此字符开头的现有组合键，请禁用 `nowait`
            },
            ["<2-LeftMouse>"] = "open", -- 双击鼠标左键打开
            ["<cr>"] = "open", -- 回车键打开
            ["<esc>"] = "cancel", -- ESC 键关闭预览或浮动 neo-tree 窗口
            ["P"] = {
              "toggle_preview", -- 切换预览
              config = {
                use_float = true, -- 使用浮动窗口
                use_snacks_image = true, -- 使用 snacks 图片支持
                use_image_nvim = true, -- 使用 image.nvim 支持
              },
            },
            ["l"] = "focus_preview", -- 聚焦预览窗口
            ["S"] = "open_split", -- 水平分割打开
            ["s"] = "open_vsplit", -- 垂直分割打开
            -- ["S"] = "split_with_window_picker", -- 使用窗口选择器水平分割
            -- ["s"] = "vsplit_with_window_picker", -- 使用窗口选择器垂直分割
            ["t"] = "open_tabnew", -- 在新标签页打开
            -- ["<cr>"] = "open_drop", -- 打开并跳转
            -- ["t"] = "open_tab_drop", -- 在标签页打开并跳转
            ["w"] = "open_with_window_picker", -- 使用窗口选择器打开
            ["C"] = "close_node", -- 关闭节点
            -- ['C'] = 'close_all_subnodes', -- 关闭所有子节点
            ["z"] = "close_all_nodes", -- 关闭所有节点
            --["Z"] = "expand_all_nodes", -- 展开所有节点
            --["Z"] = "expand_all_subnodes", -- 展开所有子节点
            ["a"] = {
              "add", -- 添加文件
              -- 此命令支持 BASH 风格的大括号展开（"x{a,b,c}" -> xa,xb,xc）
              -- 一些命令可能需要可选的配置选项，参见 `:h neo-tree-mappings`
              config = {
                show_path = "none", -- 显示路径："none", "relative", "absolute"
              },
            },
            ["A"] = "add_directory", -- 添加目录，也支持 BASH 风格的大括号展开
            ["d"] = "delete", -- 删除
            ["r"] = "rename", -- 重命名
            ["b"] = "rename_basename", -- 重命名文件名（不包括扩展名）
            ["y"] = "copy_to_clipboard", -- 复制到剪贴板
            ["x"] = "cut_to_clipboard", -- 剪切到剪贴板
            ["p"] = "paste_from_clipboard", -- 从剪贴板粘贴
            ["c"] = "copy", -- 复制，需要文本输入目标位置
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- 移动，需要文本输入目标位置
            ["q"] = "close_window", -- 关闭窗口
            ["R"] = "refresh", -- 刷新
            ["?"] = "show_help", -- 显示帮助
            ["<"] = "prev_source", -- 上一个源
            [">"] = "next_source", -- 下一个源
            ["i"] = "show_file_details", -- 显示文件详细信息
            -- ["i"] = {
            --   "show_file_details",
            --   -- 创建和最后修改时间戳的格式字符串（参见 `:h os.date()`）
            --   -- 两个选项都接受字符串或函数，函数接受秒数并返回要显示的字符串
            --   -- config = {
            --   --   created_format = "%Y-%m-%d %I:%M %p",
            --   --   modified_format = "relative", -- 等同于下面的行
            --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
            --   -- }
            -- },
          },
        },
        
        nesting_rules = {}, -- 文件嵌套规则
        
        -- 文件系统源配置
        filesystem = {
          -- 过滤项目配置
          filtered_items = {
            visible = false, -- 当为 true 时，它们只是显示得与普通项目不同
            hide_dotfiles = true, -- 隐藏点文件
            hide_gitignored = true, -- 隐藏 Git 忽略的文件
            hide_hidden = true, -- 隐藏隐藏文件（仅在 Windows 上对隐藏文件/目录有效）
            hide_by_name = {
              --"node_modules" -- 按名称隐藏的文件/目录
            },
            hide_by_pattern = { -- 使用 glob 风格模式隐藏
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = { -- 即使其他设置通常会隐藏它，也始终显示
              --".gitignored",
            },
            always_show_by_pattern = { -- 使用 glob 风格模式始终显示
              --".env*",
            },
            never_show = { -- 即使 visible 切换为 true 也保持隐藏，这会覆盖 always_show
              --".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- 使用 glob 风格模式永不显示
              --".null-ls_*",
            },
          },
          -- 跟随当前文件配置
          follow_current_file = {
            enabled = false, -- 每次更改当前文件时查找并聚焦树中的文件
            leave_dirs_open = false, -- `false` 关闭自动展开的目录，例如使用 `:Neotree reveal`
          },
          group_empty_dirs = false, -- 当为 true 时，空文件夹将被组合在一起
          hijack_netrw_behavior = "open_default", -- netrw 被禁用，打开目录在 window.position 指定的位置打开 neo-tree
          -- "open_current" -- netrw 被禁用，打开目录在窗口内打开，就像 netrw 一样，不管 window.position
          -- "disabled" -- netrw 保持不变，neo-tree 不处理打开目录
          use_libuv_file_watcher = false, -- 使用操作系统级文件监视器检测更改，而不是依赖 nvim 自动命令事件
          
          -- 文件系统窗口特定配置
          window = {
            mappings = {
              ["<bs>"] = "navigate_up", -- 向上导航
              ["."] = "set_root", -- 设置根目录
              ["H"] = "toggle_hidden", -- 切换隐藏文件显示
              ["/"] = "fuzzy_finder", -- 模糊查找
              ["D"] = "fuzzy_finder_directory", -- 模糊查找目录
              ["#"] = "fuzzy_sorter", -- 使用 fzy 算法的模糊排序
              -- ["D"] = "fuzzy_sorter_directory", -- 模糊排序目录
              ["f"] = "filter_on_submit", -- 提交时过滤
              ["<c-x>"] = "clear_filter", -- 清除过滤器
              ["[g"] = "prev_git_modified", -- 上一个 Git 修改
              ["]g"] = "next_git_modified", -- 下一个 Git 修改
              ["o"] = {
                "show_help", -- 显示排序帮助
                nowait = false,
                config = { title = "Order by", prefix_key = "o" },
              },
              ["oc"] = { "order_by_created", nowait = false }, -- 按创建时间排序
              ["od"] = { "order_by_diagnostics", nowait = false }, -- 按诊断排序
              ["og"] = { "order_by_git_status", nowait = false }, -- 按 Git 状态排序
              ["om"] = { "order_by_modified", nowait = false }, -- 按修改时间排序
              ["on"] = { "order_by_name", nowait = false }, -- 按名称排序
              ["os"] = { "order_by_size", nowait = false }, -- 按大小排序
              ["ot"] = { "order_by_type", nowait = false }, -- 按类型排序
              -- ['<key>'] = function(state) ... end, -- 自定义函数
            },
            -- 模糊查找器按键映射
            fuzzy_finder_mappings = {
              ["<down>"] = "move_cursor_down", -- 向下移动光标
              ["<C-n>"] = "move_cursor_down", -- 向下移动光标
              ["<up>"] = "move_cursor_up", -- 向上移动光标
              ["<C-p>"] = "move_cursor_up", -- 向上移动光标
              ["<esc>"] = "close", -- 关闭
              ["<S-CR>"] = "close_keep_filter", -- 关闭但保留过滤器
              ["<C-CR>"] = "close_clear_filter", -- 关闭并清除过滤器
              ["<C-w>"] = { "<C-S-w>", raw = true }, -- 原始按键映射
              {
                -- 普通模式映射
                n = {
                  ["j"] = "move_cursor_down", -- 向下移动光标
                  ["k"] = "move_cursor_up", -- 向上移动光标
                  ["<S-CR>"] = "close_keep_filter", -- 关闭但保留过滤器
                  ["<C-CR>"] = "close_clear_filter", -- 关闭并清除过滤器
                  ["<esc>"] = "close", -- 关闭
                }
              }
              -- ["<esc>"] = "noop", -- 如果你想使用普通模式
              -- ["key"] = function(state, scroll_padding) ... end, -- 自定义函数
            },
          },

          commands = {}, -- 添加自定义命令或使用相同函数名覆盖全局命令
        },
        
        -- 缓冲区源配置
        buffers = {
          -- 跟随当前文件配置
          follow_current_file = {
            enabled = true, -- 每次更改当前文件时查找并聚焦树中的文件
            leave_dirs_open = false, -- `false` 关闭自动展开的目录
          },
          group_empty_dirs = true, -- 当为 true 时，空文件夹将被组合在一起
          show_unloaded = true, -- 显示未加载的缓冲区
          window = {
            mappings = {
              ["d"] = "buffer_delete", -- 删除缓冲区
              ["bd"] = "buffer_delete", -- 删除缓冲区
              ["<bs>"] = "navigate_up", -- 向上导航
              ["."] = "set_root", -- 设置根目录
              ["o"] = {
                "show_help", -- 显示排序帮助
                nowait = false,
                config = { title = "Order by", prefix_key = "o" },
              },
              ["oc"] = { "order_by_created", nowait = false }, -- 按创建时间排序
              ["od"] = { "order_by_diagnostics", nowait = false }, -- 按诊断排序
              ["om"] = { "order_by_modified", nowait = false }, -- 按修改时间排序
              ["on"] = { "order_by_name", nowait = false }, -- 按名称排序
              ["os"] = { "order_by_size", nowait = false }, -- 按大小排序
              ["ot"] = { "order_by_type", nowait = false }, -- 按类型排序
            },
          },
        },
        
        -- Git 状态源配置
        git_status = {
          window = {
            position = "float", -- 浮动窗口位置
            mappings = {
              ["A"] = "git_add_all", -- 添加所有文件到 Git
              ["gu"] = "git_unstage_file", -- 取消暂存文件
              ["gU"] = "git_undo_last_commit", -- 撤销最后一次提交
              ["ga"] = "git_add_file", -- 添加文件到 Git
              ["gr"] = "git_revert_file", -- 恢复文件
              ["gc"] = "git_commit", -- Git 提交
              ["gp"] = "git_push", -- Git 推送
              ["gg"] = "git_commit_and_push", -- Git 提交并推送
              ["o"] = {
                "show_help", -- 显示排序帮助
                nowait = false,
                config = { title = "Order by", prefix_key = "o" },
              },
              ["oc"] = { "order_by_created", nowait = false }, -- 按创建时间排序
              ["od"] = { "order_by_diagnostics", nowait = false }, -- 按诊断排序
              ["om"] = { "order_by_modified", nowait = false }, -- 按修改时间排序
              ["on"] = { "order_by_name", nowait = false }, -- 按名称排序
              ["os"] = { "order_by_size", nowait = false }, -- 按大小排序
              ["ot"] = { "order_by_type", nowait = false }, -- 按类型排序
            },
          },
        },
      })
    end,
  },
}
