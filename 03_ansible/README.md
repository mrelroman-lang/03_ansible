# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению
-готово

## Основная часть
### 1 Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook.
[- assets\1.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/1.png?raw=true)

### 2 Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.
https://github.com/mrelroman-lang/03_ansible/blob/main/assets/2.png?raw=true

### 3 Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.
### 4 Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.

- ok: [ubuntu] => {
    "msg": "Ubuntu"
}
ok: [centos7] => {
    "msg": "RedHat"
}
TASK [Print fact] *********************************************************************************************************************
ok: [ubuntu] => {
    "msg": "deb"
}
ok: [centos7] => {
    "msg": "el"
}
[ assets\4.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/4.png?raw=true)

### 5 Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.
### 6 Повторите запуск playbook на окружении prod.yml. Убедитесь, что выдаются корректные значения для всех хостов.
[assets\6.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/6.png?raw=true)

### 7 При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.
[assets\7.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/7.png?raw=true)

### 8 Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.
[assets\8.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/8.png?raw=true)

### 9 Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.
-ansible-doc -t connection -l
Подойдет local

### 10 В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.
### 11 Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.
[assets\11.png](https://github.com/mrelroman-lang/03_ansible/blob/main/assets/11.png?raw=true)

### 12 Заполните README.md ответами на вопросы. Сделайте git push в ветку master. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым playbook и заполненным README.md.

Предоставьте скриншоты результатов запуска команд.

#Необязательная часть
### При помощи ansible-vault расшифруйте все зашифрованные файлы с переменными.
### Зашифруйте отдельное значение PaSSw0rd для переменной some_fact паролем netology. Добавьте полученное значение в group_vars/all/exmp.yml.
### Запустите playbook, убедитесь, что для нужных хостов применился новый fact.
Добавьте новую группу хостов fedora, самостоятельно придумайте для неё переменную. В качестве образа можно использовать этот вариант.
Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
Как оформить решение задания
Приложите ссылку на ваше решение в поле «Ссылка на решение» и нажмите «Отправить решение»# 03_ansible
