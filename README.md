# sh lib stack-fun

## desc

some function for handle stack for ymc shell lib

## deps

- [x] sh-lib-arr

## feat

- [x] stack
- [x] stack_push
- [x] stack_pop
- [x] stack_peek
- [x] stack_is_empty
- [x] stack_size
- [x] stack_clear
- [x] stack_print

```sh
cat src/index.sh | grep "function " | sed "s/function */- [x] /g"  | sed "s/(){//g"
```

## how to use for poduction?

```sh
# get the code

# run the index file
# ./index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage

```

## how to use for developer?

```sh
# get the code

# run test
./src/test.sh
#2 get some fail test
#./src/test.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
