### Setting $PATH
#### Add to PATH (universal variables)
```
set -U fish_user_paths /usr/local/bin $fish_user_paths
```
#### Remove from PATH
Get array index
```
echo $fish_user_paths | tr " " "\n" | nl
```
Erase element
```
set --erase --universal fish_user_paths[i]
```


#### Add to PATH (global variables)
add set line to env.fish: easier to manage
