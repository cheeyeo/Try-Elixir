# Try Elixir

![Screenshot](https://raw.githubusercontent.com/cheeyeo/Try-Elixir/master/img/term.png?token=13710__eyJzY29wZSI6IlJhd0Jsb2I6Y2hlZXllby9UcnktRWxpeGlyL21hc3Rlci9pbWcvdGVybS5wbmciLCJleHBpcmVzIjoxNDA4MTg2NTg4fQ%3D%3D--5dd8175c4a0ac2e8d1b2c7b6c8684cda38dbb9db)

An in browser IEX terminal.

It send commands to IEX through a Phoenix websocket server which then sends the results back to the browser and rendering it through jqconsole.

The inspiration for this application came from 'tryruby.org' and also
an earlier exercise in getting Porcelain to send commands to bash through
an elixir app.

To start you have to:

1. Install dependencies with `mix deps.get`
2. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

Try entering some iex commands into the terminal on the right.

## Notes

* If you choose to change the application's structure, you could manually start the router from your code like this `WebsocketsTerminal.Router.start`

## About IEX

IEX terminal is actually a module under elixir/lib/iex in the source code

Some sample code from the test_helper.exs to show how to start up iex

```elixir
opts = [colors: [enabled: true, eval_result: [:red]]]

Application.start(:iex)
Application.put_env(:iex, :colors, [enabled: false])


iex -e "Application.put_env(:iex, :colors, [enabled: false])

iex --erl "-iex colors [{enabled,false}]
```

```
proc = WebsocketsTerminal.Eval.start

command="map=HashDict.new\n"
send(proc, {self, {:input, command}})

command="map=Dict.put(map, :hello, \"world\")\n"
send(proc, {self, {:input, command}})

command="map[:hello]\n"
send(proc, {self, {:input, command}})
```

## Core Technologies used

* Elixir
* Phoenix
* Porcelain
* jquery
* jqconsole ( for code terminal )
