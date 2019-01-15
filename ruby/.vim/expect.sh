#!/usr/bin/env expect

set timeout -1
spawn vim
expect {
  "Press ENTER or type command to continue" { send "\n"; send ":q\n" }
}
expect eof
