require "curses"

include Curses

def render
  init_screen
  addstr("1st")
  setpos(1, 0)
  addstr("2nd")
  setpos(2, 0)
  addstr("3rd")
  setpos(0, 0)
end

render
noecho

@pos = 0

begin
  loop do
    case getch
    when "j"
      @pos += 1
      setpos(@pos, 0)
    when "k"
      @pos -= 1
      setpos(@pos, 0)
    when "f"
      spawn("firefox", "http://myokoym.net/", [:out, :err] => "/dev/null")
    when "q"
      break
    end
  end
ensure
  close_screen
end
