��    %      D  5   l      @     A  s   C    �  �   �  �   U  �     k   �  �   7  k   �  N   \  _   �  E   	  &   Q	  '   x	  '   �	  (   �	  �   �	  _   �
  �   )     �     �     �            E   3  ,   y  +   �  %   �     �            +        C  	   [     e     r  �  �       k       �  Z   �  �   �  �   �  R   A  �   �  T   ;  O   �  `   �  L   A      �  )   �  '   �  (     �   *  W   �  �        �     �     �     �     �  B        J  (   i  "   �     �     �  	   �  -   �       
        (     @                          	      !      $                                       "                               %                                    
                    #               
   --debug, -d
    Print information on the screen that might be
    useful for diagnosing and/or solving problems.
   --description <description|file>, -D <description|file>
    Provide a descriptive name for the command to
    be used in the default message, making it nicer.
    You can also provide the absolute path for a
    .desktop file. The Name key for will be used in
    this case.
   --disable-grab, -g
    Disable the "locking" of the keyboard, mouse,
    and focus done by the program when asking for
    password.
   --login, -l
    Make this a login shell. Beware this may cause
    problems with the Xauthority magic. Run xhost
    to allow the target user to open windows on your
    display!
   --message <message>, -m <message>
    Replace the standard message shown to ask for
    password for the argument passed to the option.
    Only use this if --description does not suffice.
   --preserve-env, -k
    Preserve the current environments, does not set $HOME
    nor $PATH, for example.
   --print-pass, -p
    Ask gksu to print the password to stdout, just
    like ssh-askpass. Useful to use in scripts with
    programs that accept receiving the password on
    stdin.
   --prompt, -P
    Ask the user if they want to have their keyboard
    and mouse grabbed before doing so.
   --su-mode, -w
    Make GKSu use su, instead of using libgksu's
    default.
   --sudo-mode, -S
    Make GKSu use sudo instead of su, as if it had been
    run as "gksudo".
   --user <user>, -u <user>
    Call <command> as the specified user.
 <b>Failed to request password.</b>

%s <b>Failed to run %s as user %s.</b>

%s <b>Incorrect password... try again.</b> <b>Options to use when changing user</b> <b>Would you like your screen to be "grabbed"
while you enter the password?</b>

This means all applications will be paused to avoid
the eavesdropping of your password by a a malicious
application while you type it. <big><b>Missing options or arguments</b></big>

You need to provide --description or --message. <big><b>Unable to determine the program to run.</b></big>

The item you selected cannot be open with administrator powers because the correct application cannot be determined. Advanced options As user: GKsu version %s

 Missing command to run. Open as administrator Opens a terminal as the root user, using gksu to ask for the password Opens the file with administrator privileges Option not accepted for --disable-grab: %s
 Option not accepted for --prompt: %s
 Root Terminal Run program Run: Usage: %s [-u <user>] [options] <command>

 User %s does not exist. _Advanced _login shell _preserve environment Project-Id-Version: gksu
Report-Msgid-Bugs-To: kov@debian.org
POT-Creation-Date: 2007-05-11 00:59-0300
PO-Revision-Date: 2007-04-02 23:22+0700
Last-Translator: Yang Zhang <zyangmath@gmail.com>
Language-Team: Chinese <translation-team-zh-cn@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Chinese
X-Poedit-Country: CHINA
 
   --debug，-d
   在屏幕上打印调试信息，这些信息可能
   对诊断或解决问题有用。
   --description <描述 | 文件>，-D <描述 | 文件>
    为待运行的命令提供一个用在默认信息中的描述性名称以使它更漂亮。
    您也可以提供一个 .desktop 文件的绝对路径，其 Name 键值将被用
    作此用途。
   --disable-grab，-g
    禁止在程序询问密码时锁定键盘、鼠标和焦点。
   --login，-l
    以此作为登录 Shell。当心这可能会导致与 Xauthority magic 的问题。
    运行 xhost 以允许目标用户在您的显示上打开窗口！
   --message <信息>，-m <信息>
    替换标准的询问密码的信息为本参数提供的信息。
    请只在 --description 不符合需要时使用。
   --preserve-env，-k
    保留当前环境，例如不重设 $HOME 和 $PATH。
   --print-pass，-p
    让 gksu 打印密码到标准输出，和 ssh-askpass 一样。
    在包含能从标准输入接收密码的程序的脚本中很有用。
   --prompt，-P
    在独占键盘和鼠标前询问用户是否需要这样做。
   --su-mode，-w
    让 GKSu 使用 su，而不是 libgksu 默认的方法。
   --sudo-mode，-S
    让 GKSu 使用 sudo 而不是 su，与运行“gksudo”效果一致。
   --user <用户>，-u <用户>
    以指定用户身份运行 <命令>。
 <b>请求密码失败。</b>

%s <b>运行 %s (以用户 %s)失败</b>

%s <b>密码不正确 ... 请重试。</b> <b>改变用户时所使用的选项</b> <b>您想在输入密码时独占屏幕吗？</b>

这意味着所有的应用程序将被暂停以避免您
输入密码时被恶意程序窃听。 <big><b>缺少选项或参数</b></big>

您需要提供 --description 或 --message。 <big><b>无法确定待运行的程序。</b></big>

由于无法确定正确的应用程序，您选择的项无法以管理员身份打开。 高级选项 以身份： GKsu 版本 %s

 缺少待运行的命令。 以管理员身份打开 以 root 用户身份打开一个终端，使用 gksu 询问密码 以管理员权限打开文件 选项未被 --disable-grab 接受：%s
 选项未被 --prompt 接受：%s
 Root 终端 运行程序 运行： 用法：%s [-u <用户>] [选项] <命令>

 用户 %s 不存在。 高级(_A) 作为登录 shell (_l) 保留当前环境(_p) 