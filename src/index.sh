#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/sh-lib-arr.sh"

# 创建栈
function stack(){
  local stack_name=
  local stack_value=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  stack_value="null"
  [ -n "$2" ] && stack_value="$2"

:<<YMC-NOTE
  if [ -n "$2" ] ; then
      out=$(arr_set "$stack_name" "$stack_value")
      #arr_set "$stack_name" "$stack_value"
    else
      #eval "$stack_name=()"
      out=$(arr_set "$stack_name" "$stack_value")
      #arr_set "$stack_name" "$stack_value"
  fi
  #eval echo "\${$stack_name[*]}"
  echo "$out"
YMC-NOTE

  #out=$(arr_set "$stack_name" "$stack_value")
  #echo "$out"
  arr_set "$stack_name" "$stack_value" > /dev/null 2>&1
}

# 修改栈-添加元素
function stack_push(){
  local stack_name=
  local stack_value=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  stack_value=" "
  [ -n "$2" ] && stack_value="$2"

  #out=$(arr_push  "$stack_value" "$stack_name")
  #echo "$out"
  arr_push  "$stack_value" "$stack_name" > /dev/null 2>&1
}

# 修改栈-删除元素
function stack_pop(){
  local stack_name=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  #echo "$stack_name"
  #out=$(arr_pop  "$stack_name")
  #echo "$out"
  arr_pop  "$stack_name" > /dev/null 2>&1
}
# 读取栈-返回元素
function stack_peek(){
  local stack_name=
  local out=
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  arr_get "$stack_name"
}
# 读取栈-是否为空
function stack_is_empty(){
  local stack_name=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  out=$(arr_size  "$stack_name")
  if [ $out -eq 0 ] ;then
    echo "true"
    else
    echo "false"
  fi
}
# 读取栈-元素个数
function stack_size(){
  local stack_name=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  #out=$(arr_size  "$stack_name")
  #echo "$out"
  arr_size  "$stack_name"
  #eval echo "\${#$stack_name[@]}"
}
# 修改栈-清空元素
function stack_clear(){
  local stack_name=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  #out=$(arr_set "$stack_name" " ")
  #echo "$out"
  arr_set "$stack_name" " " > /dev/null 2>&1
}
# 读取栈-字符串化
function stack_print(){
  local stack_name=
  local out=
  #echo -n 'stach' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack_name=b66ec8
  [ -n "$1" ] && stack_name="$1"
  #support app.xx.xx,replace app.xx.xx to app_xx_xx
  stack_name=$(echo "$stack_name" | sed "s/\./_/g")
  #out=$(arr_values "$stack_name")
  #echo "$out"
  arr_values "$stack_name"
}

# refer
# https://www.jianshu.com/p/a1f0b1e31ead