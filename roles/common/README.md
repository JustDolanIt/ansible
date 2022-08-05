# Role common

Проверьте [defaults](defaults/main.yaml) для базовых параматров, используемых в роли

## Выполняемые задачи

- Настройка окружения для root (пароли, префикс в консоли) [root](tasks/root.yaml)
- Установка требуемых пакетов [packages](tasks/packages.yaml)
- Конфигурирование хостов [configs](tasks/configs.yaml)
  - Установка hostname основанного на inventory name [hostname](tasks/hostname.yaml) (Необходимо установить переменную manage_hostname: true)
  - Настройка DNS-серверов в resolv.conf [resolv](tasks/resolv.yaml)
  - Установка PIP если задано `pip_enabled: true` [pip](tasks/pip.yaml)
  - Настройка ssh [sshd](tasks/sshd.yaml)
  - Настройка login.defs (отвечает за поведение системы при определенных действиях) [login_defs](tasks/login_defs.yaml)
  - Настройка issue (то, что выводится при подключении к консоли - содержит адреса) [issue](tasks/issue.yaml)
  - Установка skel (отвечает за то, что у новых пользователей создается в bashrc) [skel](tasks/skel.yaml)
  - Установка skel (отвечает за то, что у новых пользователей создается в bashrc) [skel](tasks/skel.yaml)
  - Настройка limits (отвечает за лимиты пользователей) [limits](tasks/limits.yaml)
  - Настройка motd (то, что выводится при подключении по SSH) [motd](tasks/motd.yaml)
  - Установка параметров systemd и связанных сервисов (делает persistent логи и другие радости жизни) [systemd](tasks/systemd.yaml)
  - Конфигурация локали UTF [locale](tasks/locale.yaml)
  - Отключение автообновлений (чтобы, скажем, PostgreSQL или RabbitMQ от автоматического апгрейда не рестартовались нежданно) [disable_auto_update](tasks/disable_auto_update.yaml)
  - Установка ручек sysctl [sysctl](tasks/sysctl.yaml)
  - Настройка sudoers [sudoers](tasks/sudoers.yaml)
  - Настройка timezone [timezone](tasks/timezone.yaml)
- Создание и конфигурирование пользователей [users](tasks/users.yaml)

## Tags

- sshd - настроить только ssh
- users - только добавить пользователей (может не сработать, если запускать отдельно, если используется нестандартная оболочка, к примеру, zsh)
- sudoers - настроить sudoers на вход без пароля
- init - добавить пользователей, настроить sudoers и настроить окружение root (для начального принятия окружения от Flant, к примеру)
- skel - применить настройку командной строки (PS1)

## TODO

- ~~Найти у бывших клиентов Flant, как они в истории root записывали пользователей, от которых сделан sudo (у windy точно видел)~~
- ~~[packages](tasks/packages.yaml): сделать установку не только через apt~~
- [motd](tasks/motd.yaml): добавить скрипт, который добавляет static описание из переменной о том, что вообще за хост для быстрого ввода в дело
- Сделать добавление записи в /etc/hosts со значением `private_addr` или, если его нет, `ansible_host` для корректной работы hostname
- Настройка правил iptables (возможно, в отдельной роле типа firewall)

## Based on

- https://github.com/golovanovsv/origin
- https://git.xena.io/xena/ansible
