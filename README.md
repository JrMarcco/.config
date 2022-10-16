* 切换源并更新

  ```powershell
  sudo pacman-mirrors -i -c china -m rank
  sudo pacman -Syyu
  ```
* 安装软件环境

  ```powershell
  sudo pacman -S yay
  sudo pacman -S vim
  sudo pacman -S git

  # i3wm
  sudo pacman -S i3-gaps

  # 状态栏
  sudo pacman -S polybar

  # 图片管理
  sudo pacman -S feh

  # 屏幕亮度管理
  sudo pacman -S light

  # 文件浏览器
  sudo pacman -S ranger

  # 终端
  sudo pacman -S alacritty

  # rofi
  sudo pacman -S rofi

  # compton，设置窗口透明度
  sudo pacman -S compton
  ```
* 中文输入法 fcitx5

  ```powershell
  sudo pacman -S fcitx5 
  sudo pacman -S fcitx5-gtk
  # 中文包
  sudo pacman -S fcitx5-chinese-addons

  # 配置输入法
  fcitx5-configtool
  # 在对话框中添加 pinyin 
  ```
* 设置屏幕 dpi（重启生效）

  ```powershell
  vim ~/.Xresources
  # 输入 Xft.dpi: 144
  # 1080p 屏幕的 dpi 默认96 
  # 这里根据需要设置合适的值
  ```

* 设置配置

  配置文件我放在[https://github.com/JrMarcco/.config](https://github.com/JrMarcco/.config)

  ```powershell
  git clone https://github.com/JrMarcco/.config.git cfg
  cd cfg

  cp alacritty ~/.config
  cp i3 ~/.config
  cp polybar ~/.config
  cp rofi ~/.config
  ```

* i3wm 配置说明

  * 第 45 行：调整音量键，默认会超过 100%，调整后每次调整 5% 最高 100%：

    ```powershell
    bindsym XF86AudioRaiseVolume exec amixer set Master playback 3275+
    bindsym XF86AudioLowerVolume exec amixer set Master playback 3275-
    ```
  * 第 48 行：调整亮度，每次调整 5%：

    ```powershell
    # Use light to adjust brightess
    bindsym XF86MonBrightnessUp exec light -A 5
    bindsym XF86MonBrightnessDown exec light -U 5
    ```

    这里要注意的是 light 需要 sudo 权限，i3wm 里面每办法执行，所以要给 light 加上 s 权限：

    ```powershell
    sudo chmod +s /usr/bin/light
    ```

  * 第 56 行：mod+Return 启动终端默认为系统默认的终端，这里改为 alacritty：

    ```powershell
    # start a terminal
    # bindsym $mod+Return exec i3-sensible-terminal
    bindsym $mod+Return exec alacritty
    ```
  * 第 59 行：关闭焦点窗口，默认 mod+Shift+q，这里改为 mod+q：

    ```powershell
    # kill focused window
    bindsym $mod+q kill
    ```

  * 第 64 行：调整 drun，默认为 dmenu_run，这里改为 rofi：

    ```powershell
    bindsym $mod+d exec --no-startup-id rofi -show drun -show-icons
    ```
  * 第 192 行：设置窗口边框 0 以及内边距 8：

    ```powershell
    for_window [class=".*"] border pixel 0
    gaps inner 8
    ```
  * 第 195 行：设置开机启动

    ```powershell
    # feh 设置壁纸，随机显示指定目录内的图片
    exec_always --no-startup-id feh --randomize --bg-fill ~/wallpapers/*
    # polybar 启动脚本
    exec_always --no-startup-id ~/.config/polybar/launch.sh
    # clash 
    exec_always --no-startup-id ~/workspaces/tools/clash.for.windows/cfw &
    # 中文输入法
    exec_always --no-startup-id fcitx5
    # compton
    exec_always --no-startup-id compton
    ```
  * 第 201 行：绑定快捷键

    ```powershell
    # 思源笔记
    bindsym $mod+n exec ~/workspaces/tools/siyuan-linux.AppImage
    ```

---
