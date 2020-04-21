#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/index.sh"

function eq() {
  if [ "$1" = "a" ]; then
    echo "true"
  else
    echo "false"
  fi
}
function test() {
  local fn=
  local expectValue=
  local ouput=
  fn=${1}
  ouput=$(eval "$fn")
  expectValue=${2}
  echo "test:$fn"
  if [ "$ouput" = "$expectValue" ]; then
    echo "it is ok"
  else
    echo "it is false.expect $ouput = $expectValue"
  fi
}

# arr_fill
# arr_splice
# arr_concat
# arr_includes
# arr_indexOf
# arr_lastIndexOf
# arr_join
# arr_slice
# arr_toString
# arr_forEach
# arr_map
# arr_keys
# arr_values
# arr_entries
# arr_every
# arr_some
# arr_filter
# arr_find
# arr_findIndex
# arr_reduce
# arr_reduceRight

#: <<simpe-usage
echo "test-创建栈："
echo "test-创建栈-默认名字："
stack
echo "test-创建栈-传入名字："
stack "app_vm_stack"
echo "test-创建栈-传入名字、取值："
#echo "${app_vm_stack[*]}"
stack "app_vm_stack" "a,b,c,d,e,f"
stack "app.vm.stack" "h,i,j,k,l,m"

echo "test-读取栈-字符串化："
stack_print
stack_print "app_vm_stack"
stack_print "app.vm.stack"

echo "test-修改栈："
echo "test-修改栈-添加栈顶："
stack_push "" "n"
stack_push "app_vm_stack" "n"
stack_push "app.vm.stack"  "n"

echo "test-读取栈-字符串化："
stack_print
stack_print "app_vm_stack"
stack_print "app.vm.stack"

echo "test-读取栈-返回栈顶："
#arr_get "app_vm_stack"
stack_peek
stack_peek "app_vm_stack"
stack_peek "app.vm.stack"

echo "test-修改栈-删除栈顶："
stack_pop
stack_pop "app_vm_stack"
stack_pop "app.vm.stack"
#echo "${app_vm_stack[*]}"

echo "test-读取栈-字符串化："
stack_print
stack_print "app_vm_stack"
stack_print "app.vm.stack"


echo "test-读取栈-是否为空："
stack_is_empty
stack_is_empty "app_vm_stack"
stack_is_empty "app.vm.stack"

echo "test-读取栈-元素个数："
stack_size
stack_size "app_vm_stack"
stack_size "app.vm.stack"

echo "test-修改栈-清空元素："
stack_clear
stack_clear "app_vm_stack"
stack_clear "app.vm.stack"

echo "test-读取栈-字符串化："
stack_print
stack_print "app_vm_stack"
stack_print "app.vm.stack"

for i in `seq 1 32`
do
  #echo "stack app.vm.stack push  $i"
  #stack_push "app.vm.stack" "$i"
  binary=$[$RANDOM%2]
  echo "stack app.vm.stack push  $binary"
  stack_push "app.vm.stack" "$binary"
done

stack_print "app.vm.stack" | sed "s/ //g"

for i in `seq 1 32`
do
  echo "stack app.vm.stack pop"
  stack_pop "app.vm.stack"
done


## file-usage
# ./src/test.sh
