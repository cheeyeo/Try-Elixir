# Try Elixir

![Screenshot](cheeyeo.github.com/Try-Elixir/img/image.jpg)

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

## Core Technologies used

* Elixir
* Phoenix
* Porcelain
* jquery
* jqconsole ( for code terminal )
