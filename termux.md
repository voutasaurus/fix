# Running fix on Android

Install Termux: https://play.google.com/store/apps/details?id=com.termux

Install game and dependencies:
```
pkg install play-audio

pkg install git

git clone https://github.com/voutasaurus/fix

cd fix
```

In dependencies.sh, uncomment the afplay function.

```
pkg install vim

vim dependencies.sh
```

Scroll to afplay function.

Touch the hash (#) in front of `function afplay` and press `x`. Do the same for the two below it (leave the one above it thats an actual comment). Then type `:wq` and press enter.

Run the game:

	./fix.sh
