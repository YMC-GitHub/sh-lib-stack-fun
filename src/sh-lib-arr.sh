#!/bin/sh

: <<note
- 生成数组
- 传入数组
- 返回数组
- 过滤数组
note
###

#declare -A a85da6
#declare -A arr
arr=()
${a85da6:- $arr}
#echo -n 'cache_arr' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6

###
# 名字: arr_set
# 参数：数组名字，数组取值，分割符号
# 返回：数组取值
# 描述： 创造数组
###
function arr_set() {
  local str=
  local split=
  local arr_name=
  split=","
  str="1,2,3,4,5,6"
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    str="$2"
  fi
  if [ -n "$3" ]; then
    split="$3"
  fi
  # all args to str
  #str="$@"
  # str to arr
  eval "$arr_name=(${str//$split/ })"
  #echo "${a85da6[*]}"
  eval echo "\${$arr_name[*]}"
}
: <<simpe-usage
# arr
arr_set "a85da6"
arr_set "a85da6" "a b c d ef g h i" " "
# key
echo "${!a85da6[*]}"
# val
echo "${a85da6[*]}"
# len
echo "${#a85da6[*]}"
simpe-usage

###
# 名字: arr_push
# 参数：数组取值，数组名字，
# 返回：数组取值
# 描述：更新数组-数组追加元素
###
function arr_push() {
  local str=
  local split=
  local arr_name=
  local shCode=
  str="null"
  arr_name="a85da6"

  if [ -n "$1" ]; then
    str="$1"
  fi
  if [ -n "$2" ]; then
    arr_name="$2"
  fi
  shCode=$(
    cat <<EOF
local arr=
arr=()
\${$arr_name:- \$arr};
$arr_name[\${#$arr_name[*]}]=$str
echo "\${$arr_name[*]}"
EOF
  )
  #eval "$shCode"
  # all args to str
  #str="$@"
  # str to arr
  eval "$arr_name[\${#$arr_name[*]}]=$str"
  #echo "${a85da6[*]}"
  eval echo "\${$arr_name[*]}"
}
: <<simpe-usage
# arr
arr_set "a85da6"
arr_set "a85da6" "a b c d ef g h i" " "
# key
echo "${!a85da6[*]}"
# val
echo "${a85da6[*]}"
# len
echo "${#a85da6[*]}"
arr_push "acd" "a"
echo "${#a[*]}"
simpe-usage

###
# 名字: arr_pop
# 参数：数组取值，数组名字，
# 返回：尾部元素
# 描述：更新数组-删除尾部元素
###
function arr_pop() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"

  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local last=
local index=
#arr=()
#\${$arr_name:- \$arr};
  len=\${#$arr_name[@]}
  index=\$((\$len - 1))
  last=\${$arr_name[\$index]}
  if [ \$len -gt 0 ]
  then
      $arr_name=(\${$arr_name[@]:0:\$((\$index))})
      #$arr_name=(\${$arr_name[@]:0:\$index})
      echo "\$last"
  fi
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
: <<simpe-usage
# arr
arr_set "a85da6"
arr_set "a85da6" "a b c d ef g h i" " "
# key
echo "${!a85da6[*]}"
# val
echo "${a85da6[*]}"
# len
echo "${#a85da6[*]}"
arr_push "acd" "a"
echo "${#a[*]}"
arr_pop "a85da6"
echo "${a85da6[*]}"
simpe-usage

###
# 名字: arr_unshfit
# 参数：数组取值，数组名字，
# 返回：数组元素
# 描述：更新数组-添加头部元素
###
function arr_unshfit() {
  local str=
  local split=
  local arr_name=
  local shCode=
  str="null"
  arr_name="a85da6"

  if [ -n "$1" ]; then
    str="$1"
  fi
  if [ -n "$2" ]; then
    arr_name="$2"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local last=
local index=
#arr=()
#\${$arr_name:- \$arr};
$arr_name=("$str" "\${$arr_name[@]}")
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}

###
# 名字: arr_shfit
# 参数：数组名字，
# 返回：数组元素
# 描述：更新数组-删除头部元素
###
function arr_shfit() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local first=
local index=
#arr=()
#\${$arr_name:- \$arr};
len=\${#$arr_name[@]}
index=\$((\$len - 1))
first=\${$arr_name[0]}
#$arr_name=(\${$arr_name=[@]:1})
$arr_name=(\${$arr_name[@]:1:\$((\$index))})
echo "\$first"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}

###
# 名字: arr_reverse
# 参数：数组名字
# 返回：数组元素
# 描述：更新数组-反序
###
function arr_reverse() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local q=
arr=("\${$arr_name[@]}")
#\${$arr_name:- \$arr};
len=\${#$arr_name[@]}
len=\$((\$len - 1))
for q in \$(seq \$len -1 0)
do
    $arr_name[\$((\$len - \$q))]=\${arr[\$q]}
    #echo "\$q"
    #echo \${arr[\$q]}
done
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}

###
# 名字: arr_sort
# 参数：数组名字,排序方向
# 返回：数组元素
# 描述：更新数组-排序
###
function arr_sort() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local direction=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  direction=""
  if [ -n "$2" ]; then
    direction="$2"
  fi
  shCode=$(
    cat <<EOF
local val=
#$arr_name=\$(echo \${$arr_name[@]} | tr ' ' '\n' | sort -n)
#$arr_name=\$(echo \${$arr_name[@]} | tr ' ' '\n' | sort -r)
$arr_name=\$(echo \${$arr_name[@]} | tr ' ' '\n' | sort $direction)
$arr_name=(\${$arr_name// /})
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}

###
# 名字: arr_copy
# 参数：数组名字,数组名字，开始位置，数组长度
# 返回：数组元素
# 描述：更新数组-复制
###
function arr_copy() {
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    arr_name2="$2"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local q=
arr=("\${$arr_name[@]}")
#\${$arr_name:- \$arr};
len=\${#$arr_name[@]}
len=\$((\$len - 1))
for q in \$(seq \$len -1 0)
do
    $arr_name[\$((\$len - \$q))]=\${arr[\$q]}
    #echo "\$q"
    #echo \${arr[\$q]}
done
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}

###
# 名字: arr_values
# 参数：数组名字
# 返回：数组元素
# 描述：读取数组-取值
###
function arr_values() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_values
# arr_values "a85da6"

###
# 名字: arr_keys
# 参数：数组名字
# 返回：数组索引
# 描述：读取数组-索引
###
function arr_keys() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
echo "\${!$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_keys
# arr_keys "a85da6"

###
# 名字: arr_size
# 参数：数组名字
# 返回：数组大小
# 描述：读取数组-大小
###
function arr_size() {
  local str=
  local split=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  shCode=$(
    cat <<EOF
echo "\${#$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_keys
# arr_keys "a85da6"

function fun_log() {
  echo "$@"
}
function fun_call() {
  local fun_name=
  local fun_args=
  fun_name="fun_log"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    fun_args="$2"
  fi
  shCode=$(
    cat <<EOF
echo \$($arr_name "$fun_args")
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
#fun_call "fun_log" "hi,how are you?"

function arr_some() {
  local fn=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 res="false"
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    res=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$res" = "true" ]; then # eq true?
      break
    fi
  done
  echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_some "" "eq"

function arr_every() {
  local fn=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 res="true"
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    res=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$res" = "false" ]; then # eq true?
      break
    fi
  done
  echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_every "" "eq"

function arr_fill() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local value=
  local s=
  local e=
  arr_name="a85da6"
  value=""
  s=0
  e=1
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    value="$2"
  fi
  if [ -n "$3" ]; then
    s="$3"
  fi
  if [ -n "$4" ]; then
    e="$4"
  fi

  shCode=$(
    cat <<EOF
local arr=
local len=
local q=
local start=
local end=
arr=("\${$arr_name[@]}")
len=\${#$arr_name[@]}
start=$s
end=$e
if [ $s -lt 0 ]; then
    start=\$((\$len + $s))
fi

if [ $e -lt 0 ]; then
    end=\$((\$len + $e))
fi
if [ \$len -lt $e ]; then
    end=$len
fi
len=\$((\$len - 1))
for q in \$(seq 0 \$end)
do
    $arr_name[\$q]=\$value
done
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_fill "" "1" "0" "5"

function arr_filter() {
  local fn=
  local arr_name=
  local arr_name2=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  arr_name2="a85da6_filter"
  if [ -n "$3" ]; then
    arr_name2="$3"
  fi
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 local temp=
 local arr=
 arr=()
 \${$arr_name2:- \$arr}
 temp="false"
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    temp=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$temp" = "true" ]; then # eq true?
      $arr_name2[\${#$arr_name2[*]}]=\$val
    fi
  done
 echo "\${$arr_name2[*]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_filter "a85da6" "eq" ""

function arr_find() {
  local fn=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 res=""
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    res=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$res" = "true" ]; then # eq true?
      res="\$val"
      break
    fi
  done
  echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_find "" "eq"

function arr_find_index() {
  local fn=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 res=""
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    res=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$res" = "true" ]; then # eq true?
      res="\$index"
      break
    fi
  done
  echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_find_index "" "eq"

function arr_for_each() {
  local fn=
  local arr_name=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 res=""
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    fun_call "$fn" "\$val" "\$index" "$arr_name"
  done
  echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_for_each "" "eq"

function arr_map() {
  local fn=
  local arr_name=
  local arr_name2=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  arr_name2="a85da6_map"
  if [ -n "$3" ]; then
    arr_name2="$3"
  fi
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 local temp=
 local arr=
 arr=()
 \${$arr_name2:- \$arr}
 temp="false"
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    temp=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
     $arr_name2[\${#$arr_name2[*]}]=\$temp
  done
 echo "\${$arr_name2[*]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_map "a85da6" "eq" ""

function arr_includes() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local value=
  local s=
  arr_name="a85da6"
  value=""
  s=0
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    value="$2"
  fi
  if [ -n "$3" ]; then
    s="$3"
  fi
  shCode=$(
    cat <<EOF
local len=
local q=
local start=
local end=
local val=
res=false
len=\${#$arr_name[@]}
start=$s
if [ \$start -lt 0 ]; then
    start=\$((\$len + \$start))
fi
if [ \$start -lt 0 ]; then
    start=0
fi
len=\$((\$len - 1))
for q in \$(seq \$start \$len)
do
    val="\${$arr_name[\$q]}"
     if [ "\$val" = "$value" ]; then # eq true?
      res="true"
      break
    fi
done
echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_includes "" "a" "0"

function arr_index_of() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local value=
  local s=
  arr_name="a85da6"
  value=""
  s=0
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    value="$2"
  fi
  if [ -n "$3" ]; then
    s="$3"
  fi
  shCode=$(
    cat <<EOF
local len=
local q=
local start=
local end=
local val=
res="-1"
len=\${#$arr_name[@]}
start=$s
if [ \$start -lt 0 ]; then
    start=\$((\$len + \$start))
fi
if [ \$start -lt 0 ]; then
    start=0
fi
len=\$((\$len - 1))
for q in \$(seq \$start \$len)
do
    val="\${$arr_name[\$q]}"
     if [ "\$val" = "$value" ]; then # eq true?
      res="\$q"
      break
    fi
done
echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_index_of "" "a" "0"

function arr_last_index_of() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local value=
  local s=
  arr_name="a85da6"
  value=""
  s=0
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    value="$2"
  fi
  if [ -n "$3" ]; then
    s="$3"
  fi
  shCode=$(
    cat <<EOF
local len=
local q=
local start=
local end=
local val=
res="-1"
len=\${#$arr_name[@]}
start=$s
if [ \$start -lt 0 ]; then
    start=\$((\$len + \$start))
fi
if [ \$start -lt 0 ]; then
    start=0
fi
len=\$((\$len - 1))
for q in \$(seq \$len -1 \$start)
do
    val="\${$arr_name[\$q]}"
     if [ "\$val" = "$value" ]; then # eq true?
      res="\$q"
      break
    fi
done
echo "\$res"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_last_index_of "" "a" "0"

function arr_fill() {
  local str=
  local split=
  local arr_name=
  local shCode=
  local value=
  local s=
  local e=
  arr_name="a85da6"
  value=""
  s=0
  e=1
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    value="$2"
  fi
  if [ -n "$3" ]; then
    s="$3"
  fi
  if [ -n "$4" ]; then
    e="$4"
  fi

  shCode=$(
    cat <<EOF
local arr=
local len=
local q=
local start=
local end=
arr=("\${$arr_name[@]}")
len=\${#$arr_name[@]}
start=$s
end=$e
if [ $s -lt 0 ]; then
    start=\$((\$len + $s))
fi

if [ $e -lt 0 ]; then
    end=\$((\$len + $e))
fi
if [ \$len -lt $e ]; then
    end=$len
fi
len=\$((\$len - 1))
for q in \$(seq 0 \$end)
do
    $arr_name[\$q]=\$value
done
echo "\${$arr_name[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_fill "" "1" "0" "5"

function arr_filter() {
  local fn=
  local arr_name=
  local arr_name2=
  local shCode=
  arr_name="a85da6"
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  fn="$2"
  arr_name2="a85da6_filter"
  if [ -n "$3" ]; then
    arr_name2="$3"
  fi
  shCode=$(
    cat <<EOF
 local index=
 local val=
 local res=
 local temp=
 local arr=
 arr=()
 \${$arr_name2:- \$arr}
 temp="false"
 for index in \${!$arr_name[*]}; do
    val="\${$arr_name[index]}"
    temp=\$(fun_call "$fn" "\$val" "\$index" "$arr_name")
    if [ "\$temp" = "true" ]; then # eq true?
      $arr_name2[\${#$arr_name2[*]}]=\$val
    fi
  done
 echo "\${$arr_name2[*]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## function usage
# arr_filter "a85da6" "eq" ""

function arr_slice() {
  local str=
  local split=
  local arr_name=
  local arr_name2=
  local shCode=
  local s=
  local e=
  arr_name="a85da6"
  arr_name2="a85da6_slice"
  s=0
  e=0
  if [ -n "$1" ]; then
    arr_name="$1"
  fi
  if [ -n "$2" ]; then
    s="$2"
  fi
  if [ -n "$3" ]; then
    e="$3"
  fi
  if [ -n "$4" ]; then
    arr_name2="$4"
  fi
  shCode=$(
    cat <<EOF
local arr=
local len=
local q=
local start=
local end=
arr=("\${$arr_name[@]}")
#arr=()
$arr_name2=\${$arr_name2:-\$arr}
len=\${#$arr_name[@]}
start=$s
end=$e
if [ $s -lt 0 ]; then
    start=\$((\$len + $s))
fi
if [ $s -lt 0 ]; then
    start=0
fi

if [ $e -eq 0 ]; then
    end=\$len
fi
if [ $e -lt 0 ]; then
    end=\$((\$len + $e))
fi
if [ \$len -lt $e ]; then
    end=\$len
fi
len=\$((\$len - 1))
for q in \$(seq \$start \$end)
do
    $arr_name2[\${#$arr_name2[*]}]=\${$arr_name[\$q]}
    #$arr_name2[\${#$arr_name2[@]}]=\${$arr_name2[\$q]}
done
echo "\${$arr_name2[@]}"
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}
## fun usage
# arr_slice "" "1" "5"

###
# 名字: arr_get
# 参数：数组名字，元素索引
# 返回：索引元素
# 描述：读取数组-返回索引元素
###
function arr_get() {
  local arr_name=
  local shCode=
  local arr_index=
  arr_name="a85da6"
  [ -n "$1" ] && arr_name="$1"
  [ -n "$2" ] && arr_index="$2"

  shCode=$(
    cat <<EOF
local arr=
local len=
local last=
local last_index=
local size=
  len=\${#$arr_name[@]}
  arr_index=$arr_index
  if [ -z \$arr_index ] ; then
    last_index=\$((\$len - 1))
    else
    last_index=\$arr_index
  fi
  last=\${$arr_name[\$last_index]}
  if [ \$len -gt 0 ] ;then
      echo "\$last"
    else
      echo ""
  fi
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}


###
# 名字: arr_get_last
# 参数：数组名字
# 返回：尾部元素
# 描述：读取数组-返回尾部元素
###
function arr_get_last() {
  local arr_name=
  local shCode=
  arr_name="a85da6"
  [ -n "$1" ] && arr_name="$1"
  shCode=$(
    cat <<EOF
local arr=
local len=
local last=
local index=
  len=\${#$arr_name[@]}
  index=\$((\$len - 1))
  last=\${$arr_name[\$index]}
  if [ \$len -gt 0 ] ;then
      echo "\$last"
    else
      echo ""
  fi
EOF
  )
  #echo "$shCode"
  eval "$shCode"
}


# file usage
# ./src/sh-lib-arr.sh
