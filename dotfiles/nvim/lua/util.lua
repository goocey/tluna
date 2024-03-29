local M = {}

function M._echo(type, mes)
  vim.cmd("echo" .. type .. " '" .. mes .. "'")
end

function M.echo( mes)
  M._echo("", mes)
end
function M.echom(mes)
  M._echo("m", mes)
end

function M.echoerr(mes)
  M._echo("err", mes)
end

function M.echoe(mes)
  M.echoerr(mes)
end

-- debug preference
function M.debug_echo(mes, args)
  if vim.g.is_enable_my_debug then
    M.echom(mes)

    if args then
      for i, v in ipairs(args) do
        M.echom(i .. " : " .. v)
      end
    end
  end
end

function M.begin_debug(mes)
  M.debug_echo("begin " .. mes)
end
function M.end_debug(mes)
  M.debug_echo("end " .. mes)
end

function M.try_catch(what)
  M.debug_echo("begin try --->")
  local status, exception = pcall(what.try)
  if not status then
    M.debug_echo("#### begin catch --->")
    what.catch(exception)
    M.debug_echo("<--- end catch ####")
  else
    M.debug_echo("<--- end try")
  end
  if what.finally then
    M.debug_echo("begin finally --->")
    what.finally()
    M.debug_echo("<--- end finally")
  end

  return exception
end
