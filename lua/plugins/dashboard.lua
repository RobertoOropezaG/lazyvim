-- lua/plugins/dashboard-header.lua
return {
  "folke/snacks.nvim",
  optional = true, -- harmless if Snacks is disabled
  opts = function(_, opts)
    -- if not vim.g.neovide then
    --   return
    -- end

    -- opts.footer = opts.footer or {}
    -- table.insert(opts.footer, function()
    --   return "Path: " .. vim.fn.getcwd()
    -- end)

    opts.dashboard = opts.dashboard or {}
    opts.dashboard.preset = opts.dashboard.preset or {}
    -- only override the header; keep default keys, pick(), footer, etc.
    opts.dashboard.preset.header = vim.fn.getcwd()
      .. "\n\n\n"
      -- [[
      -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗██████╗
      -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║██╔══██╗
      -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██████╔╝
      -- ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██╔══██╗
      -- ██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║  ██║
      -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═╝
      --
      -- ]]
-- .. [[
-- LLLLLLLLLLL                            AAA               ZZZZZZZZZZZZZZZZZZZYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM
-- LLLLLLLLLLL                           AAAAA              ZZZZZZZZZZZZZZZZZZZYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMMM             MMMMMMMMM
-- LLLLLLLLLLL                          AAAAAAA             ZZZZZZZZZZZZZZZZZZZYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMMMM           MMMMMMMMMM
-- LLLLLLLLLLL                         AAAAAAAAA            ZZZZZZZZZZZZZZZZZZ YYYYYYYY     YYYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMMMMM         MMMMMMMMMMM
--   LLLLLLL                          AAAAAAAAAAA           ZZZZZ     ZZZZZZZ  YYYYYYYYY   YYYYYYYYY VVVVVVV           VVVVVVV   IIIIII  MMMMMMMMMMMM       MMMMMMMMMMMM
--   LLLLLLL                         AAAAAAAAAAAAA                  ZZZZZZZ       YYYYYYY YYYYYYY     VVVVVVV         VVVVVVV    IIIIII  MMMMMMMMMMMMM     MMMMMMMMMMMMM
--   LLLLLLL                        AAAAAAA AAAAAAA                ZZZZZZZ         YYYYYYYYYYYYY       VVVVVVV       VVVVVVV     IIIIII  MMMMMMMMMMMMMM   MMMMMMMMMMMMMM
--   LLLLLLL                       AAAAAAA   AAAAAAA              ZZZZZZZ           YYYYYYYYYYY         VVVVVVV     VVVVVVV      IIIIII  MMMMMMMM MMMMMM MMMMMM MMMMMMMM
--   LLLLLLL                      AAAAAAA     AAAAAAA            ZZZZZZZ             YYYYYYYYY           VVVVVVV   VVVVVVV       IIIIII  MMMMMMMM  MMMMMMMMMMM  MMMMMMMM
--   LLLLLLL                     AAAAAAAAAAAAAAAAAAAAA          ZZZZZZZ               YYYYYYY             VVVVVVV VVVVVVV        IIIIII  MMMMMMMM   MMMMMMMMM   MMMMMMMM
--   LLLLLLL                    AAAAAAAAAAAAAAAAAAAAAAA        ZZZZZZZ                YYYYYYY              VVVVVVVVVVVVV         IIIIII  MMMMMMMM    MMMMMMM    MMMMMMMM
--   LLLLLLL         LLLLLL    AAAAAAAAAAAAAAAAAAAAAAAAA    ZZZZZZZZZ     ZZZZZ       YYYYYYY               VVVVVVVVVVV          IIIIII  MMMMMMMM     MMMMM     MMMMMMMM
-- LLLLLLLLLLLLLLLLLLLLLLLL   AAAAAAA             AAAAAAA   ZZZZZZZZZZZZZZZZZZZ       YYYYYYY                VVVVVVVVV         IIIIIIIIIIMMMMMMMM               MMMMMMMM
-- LLLLLLLLLLLLLLLLLLLLLLLL  AAAAAAA               AAAAAAA  ZZZZZZZZZZZZZZZZZZZ    YYYYYYYYYYYYY              VVVVVVV          IIIIIIIIIIMMMMMMMM               MMMMMMMM
-- LLLLLLLLLLLLLLLLLLLLLLLL AAAAAAA                 AAAAAAA ZZZZZZZZZZZZZZZZZZZ    YYYYYYYYYYYYY               VVVVV           IIIIIIIIIIMMMMMMMM               MMMMMMMM
-- LLLLLLLLLLLLLLLLLLLLLLLLAAAAAAA                   AAAAAAAZZZZZZZZZZZZZZZZZZZ    YYYYYYYYYYYYY                VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM
-- ]]
.. [[
LLLLLLLLLLL                            AAA               ZZZZZZZZZZZZZZZZZZZYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM
L:::::::::L                           A:::A              Z:::::::::::::::::ZY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM:::::::M             M:::::::M
L:::::::::L                          A:::::A             Z:::::::::::::::::ZY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM::::::::M           M::::::::M
LL:::::::LL                         A:::::::A            Z:::ZZZZZZZZ:::::Z Y::::::Y     Y::::::YV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M
  L:::::L                          A:::::::::A           ZZZZZ     Z:::::Z  YYY:::::Y   Y:::::YYY V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M
  L:::::L                         A:::::A:::::A                  Z:::::Z       Y:::::Y Y:::::Y     V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M
  L:::::L                        A:::::A A:::::A                Z:::::Z         Y:::::Y:::::Y       V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M
  L:::::L                       A:::::A   A:::::A              Z:::::Z           Y:::::::::Y         V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M
  L:::::L                      A:::::A     A:::::A            Z:::::Z             Y:::::::Y           V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M
  L:::::L                     A:::::AAAAAAAAA:::::A          Z:::::Z               Y:::::Y             V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M
  L:::::L                    A:::::::::::::::::::::A        Z:::::Z                Y:::::Y              V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M
  L:::::L         LLLLLL    A:::::AAAAAAAAAAAAA:::::A    ZZZ:::::Z     ZZZZZ       Y:::::Y               V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M
LL:::::::LLLLLLLLL:::::L   A:::::A             A:::::A   Z::::::ZZZZZZZZ:::Z       Y:::::Y                V:::::::V         II::::::IIM::::::M               M::::::M
L::::::::::::::::::::::L  A:::::A               A:::::A  Z:::::::::::::::::Z    YYYY:::::YYYY              V:::::V          I::::::::IM::::::M               M::::::M
L::::::::::::::::::::::L A:::::A                 A:::::A Z:::::::::::::::::Z    Y:::::::::::Y               V:::V           I::::::::IM::::::M               M::::::M
LLLLLLLLLLLLLLLLLLLLLLLLAAAAAAA                   AAAAAAAZZZZZZZZZZZZZZZZZZZ    YYYYYYYYYYYYY                VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM
]]
    --       [[
    -- ░██            ░███    ░█████████ ░██     ░██ ░██    ░██ ░██████░███     ░███
    -- ░██           ░██░██         ░██   ░██   ░██  ░██    ░██   ░██  ░████   ░████
    -- ░██          ░██  ░██       ░██     ░██ ░██   ░██    ░██   ░██  ░██░██ ░██░██
    -- ░██         ░█████████    ░███       ░████    ░██    ░██   ░██  ░██ ░████ ░██
    -- ░██         ░██    ░██   ░██          ░██      ░██  ░██    ░██  ░██  ░██  ░██
    -- ░██         ░██    ░██  ░██           ░██       ░██░██     ░██  ░██       ░██
    -- ░██████████ ░██    ░██ ░█████████     ░██        ░███    ░██████░██       ░██
    -- ]]
    --       [[
    -- █████         █████████   ███████████ █████ █████ █████   █████ █████ ██████   ██████
    -- ░░███         ███░░░░░███ ░█░░░░░░███ ░░███ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████
    --  ░███        ░███    ░███ ░     ███░   ░░███ ███   ░███    ░███  ░███  ░███░█████░███
    --  ░███        ░███████████      ███      ░░█████    ░███    ░███  ░███  ░███░░███ ░███
    --  ░███        ░███░░░░░███     ███        ░░███     ░░███   ███   ░███  ░███ ░░░  ░███
    --  ░███      █ ░███    ░███   ████     █    ░███      ░░░█████░    ░███  ░███      ░███
    --  ███████████ █████   █████ ███████████    █████       ░░███      █████ █████     █████
    -- ░░░░░░░░░░░ ░░░░░   ░░░░░ ░░░░░░░░░░░    ░░░░░         ░░░      ░░░░░ ░░░░░     ░░░░░
    -- ]]

    return opts
  end,
}
